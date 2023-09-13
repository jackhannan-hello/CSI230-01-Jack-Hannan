ip addr | grep "inet\b" | grep "/24\b" | awk '{print $2}' | cut -b -18
