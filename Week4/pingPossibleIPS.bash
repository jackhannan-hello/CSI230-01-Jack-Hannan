#!/bin/bash
input="possibleips.txt"
printf "" > activehost.txt

while read -r line
do
  checkIP=$(ping "${line}" -c 1)
  echo "${checkIP}" | grep "ttl=" | cut -d " " -f4 >> activehost.txt
done < "$input"
