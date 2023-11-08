input="logFile.txt"
: > web1.html

echo "<html>" >> web1.html
echo "<body>" >> web1.html

echo "<table>" >> web1.html
echo "<tr>" >> web1.html
echo  "<th> IP </th>" >> web1.html
echo  "<th> Time </th>" >> web1.html
echo  "<th> RequestedPage </th>" >> web1.html
echo  "<th> UserAgent </th>" >> web1.html
echo "</tr>" >> web1.html


while read -r line
do
#echo "$line"
#echo "$line" | cut -d " " -f1
echo "<tr>" >> web1.html
IP=$(echo "${line}" | cut -d " " -f1)
echo "<td>  ${IP}  </td>" >> web1.html
TIME=$(echo "${line}" | cut -d "[" -f2 | cut -d " " -f1)
echo "<td>  ${TIME}  </td>" >> web1.html
requestedPage=$(echo "${line}" | cut -d " " -f6 | cut -d "/" -f2)
echo "<td>  ${requestedPage}  </td>" >> web1.html
userAgent=$(echo "${line}" | cut -d " " -f10)
echo "<td>  ${userAgent}  </td>" >> web1.html
echo "</tr>" >> web1.html
done < "logFile.txt"

echo "</table>" >> web1.html

echo "</body>" >> web1.html
echo "</html>" >> web1.html

cp web1.html /var/www/html/web1.html
