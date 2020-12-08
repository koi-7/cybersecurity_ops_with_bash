#!/usr/bin/env bash


source ./askey.sh


function Ncrypt ()
{
    TXT="$1"
    for((i=0; i< ${#TXT}; i++))
    do
        CHAR="${TXT:i:1}"
        RAW=$(asnum "$CHAR")
        NUM=${RANDOM}
        COD=$(( RAW ^ ( NUM & 0x7F )))
        printf "%02X" "$COD"
    done
    echo
}

function Dcrypt ()
{
    TXT="$1"
    for((i=0; i< ${#TXT}; i=i+2))
    do
        CHAR="0x${TXT:i:2}"
        RAW=$(( $CHAR ))
        NUM=${RANDOM}
        COD=$(( RAW ^ ( NUM & 0x7F )))
        aschar "$COD"
    done
    echo
}


if [[ -n $1 && $1 == "-d" ]]
then
    DECRYPT="YES"
    shift
fi

KEY=${1:-1776}
RANDOM="${KEY}"
while read -r
do
    if [[ -z $DECRYPT ]]
    then
        Ncrypt "$REPLY"
    else
        Dcrypt "$REPLY"
    fi
done
