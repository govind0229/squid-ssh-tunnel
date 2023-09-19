#!/bin/bash
# Govind Kumar <govind_sharma@live.com
# Define the IP addresses to be connected

PASSWORD=''
PROXY_PORT='3128'
PORTS=("3140" "3136") # Client export http/https proxy port
IPS=("10.209.X.X" "10.209.X.X") # Client Server's ip address
N="${#PORTS[@]}"
DATE=`date '+%A %d-%B, %Y %H:%M:%S'`

service squid start

while true
do
    # Loop through the IP addresses
    for ((i=0;i<=$N;i++)); do

        # Check if the SSH tunnel is already established
        if [ ! -z "${IPS[i]}" ]; then
            ssh_tunnel=$(ps x | grep -v grep | grep ${IPS[i]})
        fi
        echo "$DATE Tunnel is active for ${IPS[i]} via port ${PORTS[i]}"

        if [ -z "$ssh_tunnel" ]; then
            # If the SSH tunnel is not established, run the SSH connection
            if [ ! -z "${PORTS[i]}" ]; then

                /usr/bin/sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=accept-new -l root ${IPS[i]} "lsof -t -i:${PORTS[i]} | xargs kill"
                sleep 1
                /usr/bin/sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=accept-new -N -f -R ${PORTS[i]}:localhost:$PROXY_PORT root@${IPS[i]}
            fi
        fi
    done
    echo ""
    sleep 1h
    killall ssh
done
