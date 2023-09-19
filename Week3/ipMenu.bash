echo "Hello. Please select an option:"
echo "1- Get my IP Address"
echo "2-Get my IP Address in binary"
echo "3-Get my Network Mask in binary"
echo "4-Get my Network Address in binary"
echo "5- Convert a binary to IP Adress"
echo "6-Quit"

read userInput

while [ "${userInput}" -ne 6 ]
do
    while [[ "${userInput}" -le 0 || "${userInput}" -ge 7 ]]
    do
	echo "Enter a valid input 1-6"
	read userInput
    done

    if [[ "${userInput}" -eq 6 ]];
    then
       break
    fi

    if [[ "${userInput}" -eq 1 ]];
    then
       echo "Your IP Address:"
       echo $(bash ipNoPrefix.bash)
    fi
    if [[ "${userInput}" -eq 2 ]];
    then
       echo "Your IP Address in Binary:"
       echo $(bash ipAsBinary.bash)
    fi
    if [[ "${userInput}" -eq 3 ]];
    then
       echo "Your Network Mask in Binary:"
       echo $(bash myMaskBinary.bash)
    fi
    if [[ "${userInput}" -eq 4 ]];
    then
       echo "Your Network Address in Binary"
       echo $(bash myNetworkBinary.bash)
    fi
    if [[ "${userInput}" -eq 5 ]];
    then
       printf "Enter your binary IP Adress (Enter 32 digits)\n"
       printf "$(bash convertBinary2IP.bash)\n"
    fi

    echo "Enter new option 1-6"
    read userInput
done
