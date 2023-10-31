input="logFile.txt"

echo > web1.html

echo \<table\> >> web1.html
echo \<tr\> >> web1.html
echo  \<th\>IP\<\/th\>" >> web1.html
echo  \<th\>Time\<\/th\> >> web1.html
echo  \<th\>RequestedPage\<\/th\> >> web1.html
echo  \<th\>UserAgent\<\/th\> >> web1.html
echo \<\/tr\>" >> web1.html

while read -r line
do
echo "$line"
echo $("$line" | cut -d " " -f1)
 echo \<tr\> >> web1.html
  echo \<td\>$("${line}" | cut -d " " -f1)\<\/td\> >> web1.html
  echo \<td\>$("${line}" | cut -d "[" -f2 | cut -d " " -f1)\<\/td\> >> web1.html
  echo \<td\>$("${line}" | cut -d " " -f6 | cut -d "/" -f2)\<\/td\> >> web1.html
  echo \<td\>$("${line}" | cut -d " " -f10)\<\/td\> >> web1.html
 echo \<\/tr\> >> web1.html
done < "logFile.txt"

echo \<\/table\> >> web1.html

cp web1.html /var/www/html/web1.html
