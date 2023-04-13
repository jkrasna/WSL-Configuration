#!/bin/bash

# The vncforward.rb ssh config is defined in ~/.ssh/config as follows:
# Host vncforward.rb
#        User <USER>
#        Hostname <IP>
#        Port 22
#        ForwardAgent yes
#        LocalForward <LOCAL_VNC_PORT> <VNC_SERV_IP>:<VNC_SERV_PORT>

if [[ ! $# -eq 1 ]]; then
	echo -e "ERROR: Not enough parameters passed"
	echo -e "    Execute script the following way:"
	echo -e "    $0 start|stop"
	exit 1
fi

if [[ $1 = "start" ]]; then
	# The -fN switch forces the SSH tunnel to run in the background without executing any programs on the remote SSH server
	ssh vncforward.rb -fN
	exit 0
fi

if [[ $1 = "stop" ]]; then
	SSH_PID=$(ps -ef | grep vncforward.rb | grep -v grep | awk '{ print $2 }')
	# To shutdown the tunnel we need to send the SSH process the SIGTERM signal
	kill -s SIGTERM $SSH_PID
	exit 0
fi

echo "ERROR: Unknown command: $1"
echo -e "    Execute script the following way:"
echo -e "    $0 start|stop"
exit 1
