input="/var/log/apache2/access.log"
ipList="clientIPs.txt"
badIPList="blacklisted.txt"
currentDate=$(date +"%d/%b/%Y")
currentHour=$(date +"%H")
currentMinute=$(date +"%M")

lastTenMins=$((${currentMinute}/10))
badVisitor=$(cat "$ipList" | cat "${input}" | egrep 'HTTP/.*" 40[0-4]' | egrep '${currentDate}:${currentHour}:[0-59]' | cut -d " " >
echo "$badVisitor" | sort | uniq -c
uniqueBadVisitor=$("$badVisitor" | sort | uniq -c)
echo "${uniqueBadVisitor}" | egrep -v '^[0-2]' | cut --complement -d -f1-7 >> blacklisted.txt
