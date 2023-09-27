#!/bin/bash
input="possibleips.txt"
printf "" > activehosts.txt

while read -r line
do
  checkIP=$(ping "${line}" -c 1)
  echo "${checkIP}" | grep "PING" | cut -d " " -f2 >> activehost.txt
done < "$input"
