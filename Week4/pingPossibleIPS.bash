#!/bin/bash
input="possibleips.txt"
printf "" > activehosts.txt

while read -r line
do
  checkIP=$(ping "${line}" -c 1)
  echo "${checkIP}" | grep "PING" | cut -d " " -f2 >> activehost.txt
  #checkIP=$(ping -c 1 $line")
  #if [ $checkIP" > /dev/null ];
  #then
  #   printf ${line}\n" >> activehosts.txt
  #fi
done < "$input"
