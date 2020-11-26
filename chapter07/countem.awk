#!/usr/bin/env bash


awk '{ cnt[$1]++ }
END { for (id in cnt) {
        printf "%d %s\n", cnt[id], id
        }
    }'
