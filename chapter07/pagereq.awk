#!/usr/bin/env bash


awk -v page="$1" '{ if ($1==page) {cnt[$7]+=1 } }
END { for (id in cnt) {
    printf "%8d %s\n", cnt[id], id
    }
}'
