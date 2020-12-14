#!/usr/bin/env bash


if (( "$#" == 0 ))
then
    printf 'Enter email address: '
    read emailin
else
    emailin="$1"
fi

##### 現在使用不可 #####
pwned=$(curl -s "https://haveibeenpwned.com/api/v2/breachedaccount/$emailin")

if [ "$pwned" == "" ]
then
    exit 1
else
    echo 'Account pwned in the following breaches:'
    echo "$pwned" | grep -Po '"Name":".*?"' | cut -d':' -f2 | tr -d '\"'
    exit 0
fi
