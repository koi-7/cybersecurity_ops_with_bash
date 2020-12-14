#!/usr/bin/env bash


cat "$1" | tr -d '\r' | while read fileLine
do
    ./01_checkpass.sh "$fileLine" > /dev/null

    if (( "$?" == 0 ))
    then
        echo "$fileLine is Pwned!"
    fi

    sleep 0.25
done
