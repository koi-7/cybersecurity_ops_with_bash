#!/usr/bin/env bash


OUTFN="${1:-${HOSTNAME}_softinv.txt}"

OSbase=win
type -t rpm &> /dev/null
(( $? == 0 )) && OSbase=rpm
type -t dpkg &> /dev/null
(( $? == 0 )) && OSbase=deb
type -t apt &> /dev/null
(( $? == 0 )) && OSbase=apt

case ${OSbase} in
    win)
        INVCMD="wmic product get name,version //format:csv"
        ;;
    rpm)
        INVCMD="rpm -qa"
        ;;
    deb)
        INVCMD="dpkg -l"
        ;;
    apt)
        INVCMD="apt list --installed"
        ;;
    *)
        echo "error: OSbase=${OSbase}"
        exit -1
        ;;
esac

$INVCMD 2>/dev/null > $OUTFN
