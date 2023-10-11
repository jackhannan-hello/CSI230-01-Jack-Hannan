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
temp=$(cat "$input" | cut -d " " -f1)
echo "${temp}" | sort | uniq | sort >> clientIPs.txt
}

#Count total unique IPS
function visitors()
{
goodVisitor=$(cat "clientIPs.txt" | cat "${input}" | grep "${currentDate}" | cut -d " " -f1)

echo "$goodVisitor" | sort | uniq -c
}

function badClients()
{
printf "" > blacklisted.txt
#lastTenMins=$((${currentMinute}/10))
badVisitor=$(cat "clientIPs.txt" | cat "${input}" | egrep 'HTTP/.*" 40[0-4]' | cut -d " " -f1) #| egrep '${currentDate}:${currentHour}:[0-59]' | cut -d " " -f1)
visitorCount=$(echo "${badVisitor}" | sort | uniq -c | cut -d " " -f6)
if [ "${visitorCount}" -gt 3 ];
then
echo "${badVisitor}" | sort | uniq -c | cut -d " " -f7 >> blacklisted.txt
fi
}

function histogram()
{
cat "${input}" | egrep 'HTTP/.* 200' | cut -d ":" -f1 | cut --complement -d "[" -f1 | uniq -c  | awk '{print $1 " visits on " $2}'
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

echo "[1] Number of Visitors"
echo "[2] Display Visitors"
echo "[3] Show Bad Visits"
echo "[4] Block Bad Visits"
echo "[5] Reset Block Rules"
echo "[6] Show Visit Histogram"
echo "[7] Quit"
echo "Enter choice"
read userInput
while [ "${userInput}" -ne 7 ]
do
if [[ "${userInput}" -eq 1 ]];
then
 listIPs
 echo $(wc -l "clientIPs.txt" | cut -d " " -f1)
elif [[ "${userInput}" -eq 2 ]];
then
 visitors
elif [[ "${userInput}" -eq 3 ]];
then
 badClients
elif [[ "${userInput}" -eq 4 ]];
then
 block
elif [[ "${userInput}" -eq 5 ]];
then
 resetblocks
elif [[ "${userInput}" -eq 6 ]];
then
 histogram
else
echo "Enter Valid Entry 1-7"
fi

echo "Enter choice"
read userInput

done
