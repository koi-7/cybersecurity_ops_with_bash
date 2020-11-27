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


if [[ $# -eq 1 ]] ; then
    readarray -t KNOWN < $1
else
    readarray -t KNOWN < useragents.txt
fi

KNSIZE=${#KNOWN[@]}

awk -F'"' '{print $1, $6}' | \
while read ipaddr dash1 dash2 dtstamp delta useragent
do
    if mismatch "$useragent"
    then
        echo "anomaly: $ipaddr $useragent"
    fi
done
