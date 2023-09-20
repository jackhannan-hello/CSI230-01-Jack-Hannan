for i in {1..20}
do
  curl 192.168.3.144/helloworld.html > /dev/null 2>&1
  echo "Accessed IP ${i} times"
done
