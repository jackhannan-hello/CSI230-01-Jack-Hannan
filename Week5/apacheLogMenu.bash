input="/var/log/apache2/access.log"
ipList="clientIPs.txt"
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

}

echo "Enter choice"
read userInput

if [ "${userInput}" -eq 0 ];
then
    listIPs
elif [ "${userInput}" -eq 1 ];
then
    visitors
elif [ "${userInput}" -eq 2 ];
then
    badClients
fi
