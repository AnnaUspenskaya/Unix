#!/bin/bash

#This script creats a new user on the local system

#Make sure the script is being executed with superuser privileges
if [[ "$UID" -eq 0 ]]
then 
	echo "Permition granted!"
	echo "You are the root user"
else 
	echo "Permition denied"
	echo "You are not a root user"
	exit 1
fi


#Get the real name (contents for the description field).
read -p 'Enter your name: ' USER_NAME


#Get the username (login)
read -p 'Enter your login: ' LOGIN 



#Get the password
read -p 'Enter the password: ' PASSWORD 

#Create the user with the password 
useradd -c "$USER_NAME" -m $LOGIN
echo $PASSWORD | passwd --stdin $LOGIN

#Check to see if the useradd command succeeded 
if [[ $? -eq 0 ]]
then 
	echo "Success! User $LOGIN was created successfully"
else 
	echo "Error: Faild to create user $LOGIN "
fi

# Force password change on first login.
passwd -e $LOGIN

# Display the username, password, and the host where the user was created.
echo '~~~~~~~~~~~~~~~~~~~'
echo "User name: $USER_NAME"
echo "User login: $LOGIN"
echo "User password: $PASSWORD"
echo "Host: $HOSTNAME"
echo '~~~~~~~~~~~~~~~~~~~'

exit 0

