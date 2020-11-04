#!/usr/bin/env bash

##### 未完 #####

if [[ $(uname) == "Darwin" ]]; then
    OS=macOS
elif [[ $(uname) == "Linux" ]]; then
    OS=Linux
else
    OS=MSWin
fi
echo $OS
