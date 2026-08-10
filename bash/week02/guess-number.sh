#!/bin/bash

number=9

while true
do
	read -p "Choose a number: (0-9) " election
	if [ $election -eq $number ]
	then
		echo "Correct!"
		break
	else
		echo "Incorrect, try again!"
	fi
done
