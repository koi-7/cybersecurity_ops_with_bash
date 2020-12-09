#!/usr/bin/env bash

if type -t wevtutil &> /dev/null
then
    # OS=MSWin
    eventcreate //D $1
else
    # OS=Linux
    logger $1
fi
# echo $OS
