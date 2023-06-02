#!/bin/bash 
#
#This script generates a list of random passwords
#
#
#A random number as a password 
PASSWORD=$RANDOM
echo 'Random number password'
echo "$PASSWORD"

#Three random number password
echo 'Three random number password'
PASSWORD=$RANDOM$RANDOM$RANDOM
echo "$PASSWORD"

#Use the current date/time as the basis  for the password
echo 'Unix time as the basis for the password'
PASSWORD=$(date +%s)
echo "$PASSWORD"

echo 'Unix time + nano seconds password'

PASSWORD=$(date +%s%N)

echo "$PASSWORD"

#Password with SHA-256 hash value 
echo 'Password with SHA-256 value'
PASSWORD=$(date +%S%N | sha256sum | head -c32)
echo "$PASSWORD"


#Password with a special character
echo 'Password with a speccial character'
S=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
PASSWORD=$PASSWORD$S
echo "$PASSWORD"

