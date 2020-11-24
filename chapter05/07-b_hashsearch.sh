#!/usr/bin/env bash


HASH=$1
DIR=${2:-.}


function mkabspath()
{
    if [[ $1 == /* ]]; then
        ABS=$1
    elif [[ $1 == ../* ]]; then
        ABS=$(cd ..; pwd)/${1:3}
    else
        ABS="$PWD/$1"
    fi
}


find $DIR -type f |
while read fn
do
    THISONE=$(sha1sum "$fn")
    THISONE=${THISONE%% *}
    if [[ $THISONE == $HASH ]]; then
        mkabspath "$fn"
        echo $ABS
    fi
done
