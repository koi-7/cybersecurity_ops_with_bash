#!/usr/bin/env bash


exec 3<>/dev/tcp/"$1"/25
echo -e 'quit\r\n' > &3
cat <&3
