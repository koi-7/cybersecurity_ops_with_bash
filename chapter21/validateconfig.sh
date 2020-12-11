#!/usr/bin/env bash


function errexit ()
{
    echo "invalid syntax at line $ln"
    echo "usage: [!]file|has|reg|[!]user|[!]group [args]"
    exit 2
}

function vfile ()
{
    local isThere=0
    [[ -e $2 ]] &&isThere=1
    (( $1 )) && let isThere=1-$isThere

    return $isThere
}

function vuser ()
{
    local isUser
    $UCMD $2 &>/dev/null
    isUser=$?
    if (( $1 ))
    then
        let isUser=1-$isUser
    fi

    return $isUser
}

function vgroup ()
{
    local isGroup
    id $2 &>/dev/null
    isGroup=$?
    if (( $1 ))
    then
        let isGroup=1-$isGroup
    fi

    return $isGroup
}

function vhash ()
{
    local res=0
    local X=$(sha1sum $2)
    if [[ ${X%% *} == $1 ]]
    then
        res=1
    fi

    return $res
}

function vreg ()
{
    local res=0
    local keypath=$1
    local value=$2
    local expected=$3
    local REGVAL=$(query $keypath //v $value)

    if [[ $REGVAL == $expected ]]
    then
        res=1
    fi
    return $res
}


UCMD="net user"
type -t net &>/dev/null || UCMD="id"
ln=0
while read cmd args
do
    let ln++

    donot=0
    if [[ ${cmd:0:1} == '!' ]]
    then
        donot=1
        # basecmd=${cmd#\!}
    fi
    basecmd=${cmd#\!}  ## ここな気がする

    case "$basecmd" in
    file)
        OK=1
        vfile $donot "$args"
        res=$?
        ;;
    hash)
        OK=1
        vhash "${args%% *}" "${args#* }"
        res=$?
        ;;
    reg)
        # Windows Only!
        OK=1
        vreg $args
        res=$?
        ;;
    user)
        OK=0
        vuser $args
        res=$?
        ;;
    group)
        OK=0
        vgroup $args
        res=$?
        ;;
    *)
        errexit
        ;;
    esac

    if (( res != OK ))
    then
        echo "FAIL: [$ln] $cmd $args"
    fi
done
