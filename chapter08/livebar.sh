#!/usr/bin/env bash


function pr_bar ()
{
    local raw maxraw scaled
    raw=$1
    maxraw=$2
    ((scaled=(maxbar*raw)/maxraw))
    ((scaled == 0)) && scaled=1
    for((i=0; i<scaled; i++)) ; do printf '#' ; done
    printf '\n'
}


maxbar=60
MAX=60
while read dayst timst qty
do
    if (( qty > MAX ))
    then
        let MAX=$qty+$qty/4
        echo "              **** rescaling: MAX=$MAX"
    fi
    printf '%6.6s %6.6s %4d:' $dayst $timst $qty
    pr_bar $qty $MAX
done
