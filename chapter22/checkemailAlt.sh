#!/usr/bin/env bash


if (( "$#" == 0 ))
then
    printf 'Enter email address: '
    read emailin
else
    emailin="$1"
fi

##### 現在使用不可 #####
URL=$(curl -s "https://haveibeenpwned.com/api/v2/breachedaccount/$emailin")
pwned=$(curl -s "$URL" | grep -Po '"Name":".*?"')

if [ "$pwned" == "" ]
then
    exit 1
else
    echo 'Account pwned in the following breaches:'
    pwned="${pwned//\"/}"
    pwned="${pwned//Name:/}"
    echo "$pwned"
    exit 0
fi
