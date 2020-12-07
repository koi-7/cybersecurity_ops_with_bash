#!/usr/bin/env bash


UPTOP=$(tput cuop 0 0)
ERA2EOL=$(tput el)
REV=$(tput rev)
OFF=$(tput sgr0)
SMUL=$(tput smul)
RMUL=$(tput rmul)
COLUMNS=$(tput cols)
printf -v DASHES '%*s' $COLUMNS '-'
DASHES=${DASHES// /-}


function prSection ()
{
    local -i i
    for((i=0; i < ${1:-5}; i++))
    do
        read aline
        printf '%s%s\n' "$aline" "${ERA2EOL}"
    done
    printf '%s%s\n%s' "$DASHES" "${ERA2EOL}" "${ERA2EOL}"
}

function cleanup ()
{
    if [[ -n $BGPID ]]
    then
        kill %1
        rm -f $TMPFILE
    fi
} &> /dev/null


trap cleanup EXIT

TMPFILE=$(tempfile)
{ bash tailcount.sh $1 | \
  bash livebar.sh > $TMPFILE ; } &
BGPID=$!

clear
while true
do
    printf '%s' "$UPTOP"
    echo "${REV}Rapid Cyber Ops Ch. 12 -- Security Dashboard${OFF}" \
    | prSection 1

    {
        printf 'connections:%4d        %s\n' \
              $(netstat -an | grep 'ESTAB' | wc -l) "$(date)"
    } | prSection 1

    tail -5 /var/log/syslog | cut -c 1-16,45-105 | prSection 5

    { echo "${SMUL}yymmdd${RMUL}"    \
            "${SMUL}hhmmss${RMUL}"  \
            "${SMUL}count of events${RMUL}"
      tail -8 $TMPFILE
    } | prSection 9
    sleep 3
done

