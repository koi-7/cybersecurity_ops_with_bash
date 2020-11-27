#!/usr/bin/env bash


function mismatch ()
{
    local -i i
    for ((i=0; i<$KNSIZE; i++))
    do
        [[ "$1" =~ .*${KNOWN[$i]}.* ]] && return 1
    done
    return 0
}


while getopts f opt
do
    case $opt in
        f)
            LOGFILE=$2
            ;;
    esac
done

readarray -t KNOWN < useragents.txt
KNSIZE=${#KNOWN[@]}

awk -F'"' '{print $1, $6}' $LOGFILE | \
while read ipaddr dash1 dash2 dtstamp delta useragent
do
    if mismatch "$useragent"
    then
        echo "anomaly: $ipaddr $useragent"
    fi
done
