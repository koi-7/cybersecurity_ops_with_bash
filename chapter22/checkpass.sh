#!/usr/bin/env bash


if (( "$#" == 0 ))
then
    printf 'Enter your password: '
    read -s passin
else
    passin="$1"
    echo
fi

passin=$(echo -n "$passin" | sha1sum)
passin=${passin:0:40}

firstFive=${passin:0:5}
ending=${passin:6}

pwned=$(curl -s "https://api.pwnedpasswords.com/range/$firstFive" | \
        tr -d '\r' | grep -i "$ending")
passwordFound=${pwned##*:}

if [ "$passwordFound" == "" ]
then
    exit 1
else
    printf 'Password is Pwned %d Times!\n' "$passwordFound"
    exit 0
fi
