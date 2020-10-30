#!/usr/bin/env bash

function osdetect ()
{
    if type -t wevtutil &> /dev/null
    then
        OS=MSWin
    elif type -t scutil &> /dev/null
    then
        OS=macOS
    else
        OS=Linux
    fi
}

osdetect
echo $OS
