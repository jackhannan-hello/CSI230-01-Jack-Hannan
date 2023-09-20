echo "Enter a valid IP Address"
read ip
echo "Enter a valid Prefix Length"
read prefix
#ip=$(bash ipWithPrefix.bash)
#prefix=$(bash prefixLength.bash)
ipList=""
printf "" > ipCounter.txt

ipPart1=$(echo "$ip" | cut -d "." -f1)
ipPart2=$(echo "$ip" | cut -d "." -f2)
ipPart3=$(echo "$ip" | cut -d "." -f3)

ipPart1Binary=$(echo "obase=2;$ipPart1" | bc)
ipPart2Binary=$(echo "obase=2;$ipPart2" | bc)
ipPart3Binary=$(echo "obase=2;$ipPart3" | bc)

if [ "${prefix}" -eq 24 ];
then
   for i in {1..254}
   do
     hostIP=$(echo "obase=2;$i" | bc)
     printf '%08d' "${ipPart1Binary}" >> ipCounter.txt
     printf '%08d' "${ipPart2Binary}" >> ipCounter.txt
     printf '%08d' "${ipPart3Binary}" >> ipCounter.txt
     printf '%08d\n' "${hostIP}" >> ipCounter.txt
   done
else
   networkIP=$(echo "$ipPart1Binary""$ipPart2Binary")
   numIPAddrs=0
   for i in {1..254}
   do
     for j in {1..254}
     do
       hostIP1=$(echo "obase=2;$i" | bc)
       hostIP2=$(echo "obase=2;$j" | bc)
       printf '%08d' "${ipPart1Binary}" >> ipCounter.txt
       printf '%08d' "${ipPart2Binary}" >> ipCounter.txt
       printf '%08d' "${hostIP1}" >> ipCounter.txt
       printf '%08d\n' "${hostIP2}" >> ipCounter.txt
     done
   done
fi
