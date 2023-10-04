activeHosts="/home/jhannan/CSI230-01JHannan/Week4/activehost.txt"

printf "" > webservers.txt

while read -r line
do
 response=$(curl --head "${line}"/helloworld.html | grep "200")
 if [ "${#response}" -ge 1 ]
 then
     echo "$line" >> webservers.txt
     echo "$line"
 fi
 #echo "$line"
 #echo "$response"
 #echo ""
 #echo ""
done < "$activeHosts"
