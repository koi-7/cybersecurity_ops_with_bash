#!/usr/bin/env bash


function cleanup ()
{
    [[ -n $LOPID ]] && kill $LOPID
}


trap cleanup EXIT

bash looper.sh $1 &
LOPID=$!

sleep 3

while true
do
    kill -SIGUSR1 $LOPID
    sleep 5
done >&2
