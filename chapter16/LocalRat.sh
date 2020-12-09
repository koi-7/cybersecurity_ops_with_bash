#!/usr/bin/env bash


function bgfilexfer ()
{
    while true
    do
        FN=$(nc -nlvvp $HOMEPORT2 2>>/tmp/x2.err)
        if [[ $FN == 'exit' ]] ; then exit ; fi
        nc -nlp $HOMEPORT3 < $FN
    done
}


HOMEPORT=$1
HOMEPORT2=${2:-$((HOMEPORT+1))}
HOMEPORT3=${3:-$((HOMEPORT2+1))}

bgfilexfer &

nc -nlvp $HOMEPORT
