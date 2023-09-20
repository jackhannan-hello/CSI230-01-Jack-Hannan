input="/var/log/apache2/access.log"

while read -r line
do
  currentDate=$(date +"%d/%b/%Y")
  echo "${line}" | grep "${currentDate}" | cut -d "]" -f1
done < "$input"
