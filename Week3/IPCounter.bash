echo "Enter a valid IP Address"
read ip
echo "Enter a valid Prefix Length"
read prefix
#ip=$(bash ipWithPrefix.bash)
#prefix=$(bash prefixLength.bash)
ipList=""

D2B=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})

ipPart1=$(echo "$ip" | cut -d "." -f1)
ipPart2=$(echo "$ip" | cut -d "." -f2)
ipPart3=$(echo "$ip" | cut -d "." -f3)

ipPart1Binary=$(echo "${D2B[$ipPart1]}")
ipPart2Binary=$(echo "${D2B[$ipPart2]}")
ipPart3Binary=$(echo "${D2B[$ipPart3]}")

if [ "${prefix}" -eq 24 ];
then
   networkIP=$(echo "$ipPart1Binary""$ipPart2Binary""$ipPart1Binary")
   for i in {1..254}
   do
     hostIP=$(echo "${D2B[$i]}")
     tempIPAddr=$(echo "$networkIP""$hostIP")
     ipList+=$(echo "$IP Address ${i}: ${tempIPAddr} |")
   done
else
   networkIP=$(echo "$ipPart1Binary""$ipPart2Binary")
   numIPAddrs=0
   for i in {1..254}
   do
     hostIP1=$(echo "${D2B[$i]}" )
     for j in {1..254}
     do
       #numIPAddrs=$(echo $i + $j")
       hostIP2=$(echo "${D2B[$j]}" )
       tempIPAddr=$(echo "$networkIP""$hostIP1""$hostIP2")
       ipList+="$IP Address : ${tempIPAddr} |"
     done
   done
fi

echo "${ipList}" > ipCounter.txt
