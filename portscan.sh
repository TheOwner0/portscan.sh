#!/bin/bash

if [ $1 ]; then
	ip_add=$1
	for port in $(seq 1 65535); do
		timeout 1 bash -c "echo '' > /dev/tcp/$ip_add/$port " 2>/dev/nul && echo "THE PORT $port=OPEN" &
	done; wait
else
	echo -e "\n[*] USE ./portscan <ip_add_vitima>\n"
	exit 1
fi

