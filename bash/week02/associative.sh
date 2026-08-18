#!/bin/bash

#Associate array
declare -A items=([User]="" [Hostname]="" [Date]="" [Directory]="")

echo ${!items[@]}
echo "${items[User]}"
echo "${items[Hostname]}"
items[User]="$(whoami)"
echo "${items[User]}"
items[Hostname]="$(hostname)"
echo "${items[Hostname]}"


#New array
declare -A elements
elements[User]="$(whoami)"
elements[Hostname]="$(hostname)"
elements[Date]="$(date +"%Y-%m-%d %H:%M:%S")"
elements[Directory]="$(pwd)"


echo "User: ${elements[User]}"
echo "Hostname: ${elements[Hostname]}"

echo "List keys:"
echo "${!elements[@]}"

echo "List value:"
echo "${elements[@]}"

#For
echo FOR:
for key in ${!elements[@]}
do
	echo "$key:  ${elements[$key]}"
done
	

