#!/usr/bin/env bash


a ()
{
    local a="Local Variable a"
    echo "$a"
}


a="Global Variable a"
echo "$a"

a
