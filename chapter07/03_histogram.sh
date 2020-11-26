#!/usr/bin/env bash


function pr_bar ()
{
    local -i i raw maxraw scaled
    raw=$1
    maxraw=$2
    ((scaled=(MAXBAR*raw)/maxraw))

    ((raw > 0 && scaled == 0)) && scaled=1

    for((i=0; i<scaled; i++)) ; do printf '#' ; done
    printf '\n'
}


declare -A RA
declare -i MAXBAR max
max=0
MAXBAR=50

while getopts s opt
do
    case $opt in
        s)
            MAXBAR=$2
            ;;
    esac
done


while read labl val
do
    let RA[$labl]=$val
    (( val > max )) && max=$val
done

for labl in "${!RA[@]}"
do
    printf '%-20.20s  ' "$labl"
    pr_bar ${RA[$labl]} $max
done
