#!/usr/bin/env bash


i=1

for ARG
do
    if [[ $(($i%2)) -eq 0 ]]; then
        echo "arg$i: $ARG"
    fi
    let i++
done
