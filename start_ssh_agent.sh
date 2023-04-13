#!/bin/bash

# start this script like this: . ./start_ssh_agent.sh
# this is to ensure that the agent has the connection to the same bash process/session

eval `ssh-agent`
ssh-add ~/.ssh/id_ed25519

