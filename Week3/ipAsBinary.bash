ip=$(bash ipNoPrefix.bash)

ipPart1=$(echo "$ip" | cut -d "." -f1)
ipPart2=$(echo "$ip" | cut -d "." -f2)
ipPart3=$(echo "$ip" | cut -d "." -f3)
ipPart4=$(echo "$ip" | cut -d "." -f4)


ipPart1Binary=$(echo "obase=2;$ipPart1" | bc)
ipPart2Binary=$(echo "obase=2;$ipPart2" | bc)
ipPart3Binary=$(echo "obase=2;$ipPart3" | bc)
ipPart4Binary=$(echo "obase=2;$ipPart4" | bc)

printf '%08d' "${ipPart1Binary}"
printf '%08d' "${ipPart2Binary}"
printf '%08d' "${ipPart3Binary}"
printf '%08d\n' "${ipPart4Binary}"

