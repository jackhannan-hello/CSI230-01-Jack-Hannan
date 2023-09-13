echo "Hello. Please select an option:"
echo "1- Get my IP Address"
echo "2-Get my IP Address in binary"
echo "3-Get my Network Mask in binary"
echo "4-Get my Network Address in binary"
echo "5- Convert a binary to IP Adress"
echo "6-Quit"

read userInput

while [ "${userInput}" -ne 6 ];
do
    while [ "${userInput}" -lt 1 || "${userInput}" -gt 6 ];
    do
	echo "Enter a valid input 1-6"
	read userInput
    done


done
