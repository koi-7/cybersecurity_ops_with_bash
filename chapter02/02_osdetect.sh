#!/usr/bin/env bash


if [[ $(uname) == "Darwin" ]]; then
    OS=macOS
elif [[ $(uname) == "Linux" ]]; then
    OS=Linux
else
    OS=MSWin
fi
echo $OS
