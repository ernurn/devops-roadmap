#!/bin/bash


if [ $# != 0 ]
then 
	if [ -e "$@" ] 
	then
		echo "Exists"
	if [ -d "$@" ]
	then
		echo "Is a directory"
	elif [ -f "$@" ]
	then
		echo "Is a file"
	else
		echo "Other type of file"
	fi
	else
		echo "Does not exist"
	fi
else
	echo "Without path"
fi
