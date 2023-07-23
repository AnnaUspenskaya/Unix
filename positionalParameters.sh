#!/bin/bash 

#Display what the user typed on the command line 
echo "You executed this command: $0"

#Display the path and filename of the script 
echo "You used $(dirname $0) as the path to the $(basename $0) script."

#Tell how many argumnets are passed in.
#(Inside the script they are parameters, and outside they are arguments)

NUMBER_OF_PARAMETERS="$#"
echo "You supplied $NUMBER_OF_PARAMETERS argument(s) on the command line."

#Generate and display a password for each parameter 
for USER_NAME in "$@"
do 
	PASSWORD=$(date +%s%N | sha256sum | head -c48)
	echo "$USER_NAME: $PASSWORD"
done

