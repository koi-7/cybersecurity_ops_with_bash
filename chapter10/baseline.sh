#!/usr/bin/env bash


function usageErr ()
{
    echo 'usage: baseline.sh [-d path] file1 [file2]'
    echo 'creates or compares a baseline from path'
    echo 'default for path is /'
    exit 2
} >&2


function dosumming ()
{
    find "${DIR[@]}" -type f | xargs -d '\n' sha1sum
}


function parseArgs ()
{
    while getopts "d:" MYOPT
    do
        DIR+=( "$OPTARG" )
    done
    shift $((OPTIND-1))

    (( $# == 0 || $# > 2 )) && usageErr

    (( ${#DIR[*]} == 0 )) && DIR=( "/" )
}


declare -a DIR

parseArgs
BASE="$1"
B2ND="$2"

if (( $# == 1 ))
then
    dosumming > "$BASE"
    exit
fi

if [[ ! -r "$BASE" ]]
then
    usageErr
fi

if [[ ! -e "$B2ND" ]]
then
    echo creating "$B2ND"
    dosumming "$B2ND"
fi

declare -A BYPATH BYHASH INUSE

while read HNUM FN
do
    BYPATH["$FN"]=$HNUM
    BYHASH[$HNUM]="$FN"
    INUSE["$FN"]="X"
done < "$BASE"

printf '<filesystem host="%s" dir="%s">\n' "$HOSTNAME" "${DIR[*]}"

while read HNUM FN
do
    WASHASH="${BYPATH[${FN}]}"
    if [[ -z $WASHASH ]]
    then
        ALTFN="${BYHASH[$HNUM]}"
        if [[ -z $ALTFN ]]
        then
            pritnf '  <new>%s</new>\n' "$FN"
        else
            printf '  <relocated orig="%s">%s</relocated>\n' "$ALTFN" "$FN"
            INUSE["$ALTFN"]='_'
        fi
    else
        INUSE["$FN"]='_'
        if [[ $HNUM == $WASHASH ]]
        then
            continue;
        else
            printf '  <changed>%s</changed>\n' "$FN"
        fi
    fi
done < "$B2ND"

for FN in "${!INUSE[@]}"
do
    if [[ "${INUSE[$FN]}" == 'X' ]]
    then
        printf '  <removed>%s</removed>\n' "$FN"
    fi
done

printf '</filesystem>\n'
