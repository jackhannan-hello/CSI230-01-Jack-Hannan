#! /bin/bash

#printf "Enter your binary IP Adress (Enter 32 digits)\n
read binaryIP

ipBinaryPart1=$(echo "$binaryIP" | cut -b 1-8)
ipBinaryPart2=$(echo "$binaryIP" | cut -b 9-16)
ipBinaryPart3=$(echo "$binaryIP" | cut -b 17-24)
ipBinaryPart4=$(echo "$binaryIP" | cut -b 25-32)

ipPart1=$((2#"${ipBinaryPart1}"))
ipPart2=$((2#"${ipBinaryPart2}"))
ipPart3=$((2#"${ipBinaryPart3}"))
ipPart4=$((2#"${ipBinaryPart4}"))
printf "Your Binary Number as an IP Address\n"
printf "${ipPart1}."
printf "${ipPart2}."
printf "${ipPart3}."
printf "${ipPart4}\n"
