input="/etc/shadow"
user=$(cat "usr.txt")
function Help()
{
echo "-------------------------------------"
echo "Proper Syntax Accounts.bash -d or -c"
echo "d list diabled accounts"
echo "c count logins of the user"
echo "Any Other Charecter prints help menu"
echo "-------------------------------------"
}

userInput=$1

if [ ${#} -ne 1 ]; then
Help
exit;
fi

while getopts ":dc" option; do
	case $option in
	d) #list diabled accounts
	ussers=$(cat "$input" | grep -v ":!:" | cut -d ":" -f1)
	echo "$ussers"
	;;
	c) #count logins of a user
	logins=$(last "$user" | cut -d " " -f1)
	echo "${logins}" | sort | uniq -c | grep "${user}"
	;;
	esac
done
