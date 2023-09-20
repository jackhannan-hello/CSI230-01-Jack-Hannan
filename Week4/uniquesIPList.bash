ipList=$(bash ipAddressList.bash)
currentDate=$(date +"%d/%b/%Y")

echo "${ipList}" | cut -d ":" -f1 | sort | uniq -c | sort -nr
