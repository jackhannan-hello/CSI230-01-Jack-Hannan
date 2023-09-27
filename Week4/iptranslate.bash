input="/home/jhannan/CSI230-01JHannan/Week3/ipCounter.txt"

printf "" > possibleips.txt

while read -r line
do
  ipBinaryPart1=$(echo "$line" | cut -b 1-8)
  ipBinaryPart2=$(echo "$line" | cut -b 9-16)
  ipBinaryPart3=$(echo "$line" | cut -b 17-24)
  ipBinaryPart4=$(echo "$line" | cut -b 25-32)

  ipPart1=$((2#"${ipBinaryPart1}"))
  ipPart2=$((2#"${ipBinaryPart2}"))
  ipPart3=$((2#"${ipBinaryPart3}"))
  ipPart4=$((2#"${ipBinaryPart4}"))
  printf "${ipPart1}." >> possibleips.txt
  printf "${ipPart2}." >> possibleips.txt
  printf "${ipPart3}." >> possibleips.txt
  printf "${ipPart4}\n" >> possibleips.txt
done < "$input"
