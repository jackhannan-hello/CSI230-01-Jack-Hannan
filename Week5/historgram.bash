input="/var/log/apache2/access.log"


cat "${input}" #| egrep 'HTTP/.* 200' | cut -d ":" -f1 # | cut --complement -d "[" -f1 | uniq -c  | awk '{print $1 " visits on " $2}'
#	cat "${input}" | egrep 'HTTP/.* 200' | cut -d ":" -f1 # | cut --complement -d "[" -f1 | uniq -c  | awk '{print $1 " visits on " $2}'
#cat "${input}" | egrep 'HTTP/.* 200' | cut -d ":" -f1 # | cut --complement -d "[" -f1 | uniq -c  | awk '{print $1 " visits on " $2}'
#cat "${input}" | egrep 'HTTP/.* 200' | cut -d ":" -f1 # | cut --complement -d "[" -f1 | uniq -c  | awk '{print $1 " visits on " $2}'
#cat "${input}" | egrep 'HTTP/.* 200' | cut -d ":" -f1 # | cut --complement -d "[" -f1 | uniq -c  | awk '{print $1 " visits on " $2}'
