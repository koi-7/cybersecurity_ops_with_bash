#!/usr/bin/env bash


function tagit ()
{
    printf '<%s>%s</%s>\n' "${1}" "${2}" "${1}"
}


echo "<html>"
echo "<body>"
echo "<h1>$1</h1>"

echo "<table border=1>"
echo "<tr>"
echo "<th>IP Address</th>"
echo "<th>Date</th>"
echo "<th>URL Requested</th>"
echo "<th>Status Code</th>"
echo "<th>Size</th>"
echo "<th>Referrer</th>"
echo "<th>User Agent</th>"
echo "</tr>"

while read f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12plus
do
    echo "<tr>"
    tagit "td" "${f1}"
    tagit "td" "${f4} ${f5}"
    tagit "td" "${f6} ${f7}"
    tagit "td" "${f9}"
    tagit "td" "${f10}"
    tagit "td" "${f11}"
    tagit "td" "${f12plus}"
    echo "</tr>"
done < $1

echo "</table>"
echo "</body>"
echo "</html>"

