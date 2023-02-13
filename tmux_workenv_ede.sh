#!/bin/bash

# Session name (to avoid repeated occurences)
S_NAME="Dev"

if [[ $(tmux ls | grep $S_NAME | wc -l) -eq 0 ]]; then
	# Name for first window name
	W_NAME="dockerd"

	# Command to execute in the first window
	W_CMD="./run_docker_daemon.sh"

	# Start the session and window 0 in the user home folder
	#   This will also be the default cwd for new windows created
	#   via a binding unless overridden with default-path.
	cd ~
	tmux new-session -s $S_NAME -n $W_NAME -d $W_CMD 

	# Create two windows in ~/workspace folder
	cd ~/workspace
	tmux new-window -a -n "Main"
	tmux new-window -a -n "Side"

	# Select window #2 (indexes start with 1)
	tmux select-window -t "$S_NAME:2"
fi

# Attach to the session
tmux -2 attach-session -t "$S_NAME"
