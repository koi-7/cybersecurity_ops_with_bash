#!/usr/bin/env bash


echo "there are $# arguments"
i=1

for ARG
do
    echo "arg$i: $ARG"
    let i++
done
