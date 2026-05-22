#!/bin/bash

#special vars#
echo "All variables passed to script: $@"
echo "Number of Variables: $#"
echo "First variable:  $1"
echo "Secund Variable: $2"
echo "Script name: $0"
echo "Who is running this: $USER"
echo "Which directory: $PWD"
echo "Home directory: $HOME"
echo "PID of the current script: $$"
sleep 5 &
echo "PID of the background command running just now: $!"