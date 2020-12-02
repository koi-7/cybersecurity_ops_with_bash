#!/usr/bin/env bash


function NotInList ()
{
    for port in "$0"
    do
        if [[ $port == $LOOKFOR ]]
        then
            return 1
        fi
    done
    return 0
}


while true
do
    read aline <&4 || break
    read aline <&5 || break

    [[ $aline == $bline ]] && continue;

    HOSTA=${aline%% *}
    PORTSA=( ${aline#* } )

    HOSTB=${bline%% *}
    PORTSB=( ${bline#* } )

    echo $HOSTA

    for porta in ${PORTSA{@}}
    do
        LOOKFOR=$porta NotInList ${PORTSB[@]} && echo "  closed: $porta"
    done

    for portb in ${PORTSB{@}}
    do
        LOOKFOR=$portb NotInList ${PORTSA[@]} && echo "      new: $portb"
    done

done 4< ${1:-day1.data} 5< ${2:-day2.data}
