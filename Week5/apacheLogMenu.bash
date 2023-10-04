input="/var/log/apache2/access.log"
ipList="clientIPs.txt"
badIPList="blacklisted.txt"
currentDate=$(date +"%d/%b/%Y")
currentHour=$(date +"%H")
currentMinute=$(date +"%M")

#list of unique IPS accessed web page
function listIPs()
{
printf "" > clientIPs.txt
ipList=""
temp=$(cat "$input" | cut -d " " -f1)
echo "${temp}" | sort | uniq | sort >> clientIPs.txt
}

#Count total unique IPS
function visitors()
{
goodVisitor=$(cat "$ipList" | cat "${input}" | grep "${currentDate}" | cut -d " " -f1)

echo "$goodVisitor" | sort | uniq -c
}

function badClients()
{
lastTenMins=$((${currentMinute}/10))
badVisitor=$(cat "$ipList" | cat "${input}" | egrep 'HTTP/.*" 40[0-4]' | egrep '${currentDate}:${currentHour}:${lastTenMins}[0-9]' | cut -d " " -f1)
echo "$badVisitor" | sort | uniq -c
uniqueBadVisitor=("$badVisitor" | sort | uniq -c)
echo "${uniqueBadVisitor}" | egrep -v '^[0-2] | cut --complement -d -f1-7 >> blacklisted.txt
}

function histogram()
{
cat "${input}" | egrep 'HTTP/.* 200' | cut -d ":" -f1 | cut --complement -d "[" -f1 | uniq -c | awk '{print $1 " visits on " $2}'
}

function block()
{
blockedIPs=$(cat "$badIPList")
for ipAddr in "$blockedIPs";
do
  iptables -A INPUT -s "$ipAddr" -j Drop
done
}

function resetblocks()
{
iptables -F
}

echo "Enter choice"
read userInput

if [ "${userInput}" -eq 1 ];
then
    listIPs
elif [ "${userInput}" -eq 2 ];
then
    visitors
elif ["${userInput}" -eq 3 ];
then
    badClients
fi
