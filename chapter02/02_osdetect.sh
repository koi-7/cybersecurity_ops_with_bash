#!/usr/bin/env bash

##### 未完 #####

if type -t wevtutil &> /dev/null
then
    OS=MSWin
elif type -t scutil &> /dev/null
then
    OS=macOS
else
    OS=Linux
fi
echo $OS
