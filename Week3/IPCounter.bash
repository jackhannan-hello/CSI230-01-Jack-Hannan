echo "Enter a valid IP Address"
read ip
echo "Enter a valid Prefix Length"
read prefix
#ip=$(bash ipWithPrefix.bash)
#prefix=$(bash prefixLength.bash)
ipList=""

prefixLength=$( "$prefix" | cut -d "/" -f2 )
ipPart1=$(echo "$ip" | cut -d "." -f1)
ipPart2=$(echo "$ip" | cut -d "." -f2)
ipPart3=$(echo "$ip" | cut -d "." -f3)

ipPart1Binary=$(echo "obase=2;$ipPart1" | bc)
ipPart2Binary=$(echo "obase=2;$ipPart2" | bc)
ipPart3Binary=$(echo "obase=2;$ipPart3" | bc)



networkIP=$(echo "$ip" | cut -b 1-"$prefix")
if [ "${prefix
hostBits=$(echo 32 - "$prefix")
numDifIPAddrs=$(echo "$hostBits" * 32 - "$hostBits" / 4)
for i in {1.."${numDifIPAddrs}"}
  do
     hostIP=$(echo "obase=2;$i" | bc)
     tempIPAddr=$(echo $"networkIP" + $"hostIP")
     ipList+="$IP Address ${i}: ${tempIPAddr}"
  done

echo $"ipList" > ipCounter
