#!/usr/bin/env bash


while true
do
    clear
    echo 'Cybersecurity Ops System Monitor'
    echo 'Status: Scanning ...'
    echo '------------------------------------------'
    while read -r ipadd
    do
        ipadd=$(echo "$ipadd" | sed 's/\r//')
        # ping -n 1 "$ipadd" | egrep '(Destination host unreadhchable|100%)' &> /dev/null
        ping -c 1 "$ipadd" | egrep '(Destination host unreadhchable|100%)' &> /dev/null
        if (( "$?" == 0 ))
        then
            tput setaf 1
            echo "Host $ipadd not found - $(date)" | tee -a monitorlog.txt
            tput setaf 7
        fi
    done < "$1"

    echo ""
    echo "Done."

    for ((i="$2"; i > 0; i--))
    do
        tput cup 1 0
        echo "Status: Next scan in $i seconds"
        sleep 1
    done
done
