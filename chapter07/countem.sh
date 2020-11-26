#!/usr/bin/env bash


declare -A cnt
while read id xtra
do
    let cnt[$id]++
done

for id in "${!cnt[@]}"
do
    printf '%d %s\n' "${cnt[$id]}" "$id"
done
