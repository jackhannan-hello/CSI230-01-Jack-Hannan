input="/var/log/apache2/access.log"
input1="/var/log/apache2/access.log.1"

cat "$input" >> logFile.txt
cat "$input1" >> logFile.txt

