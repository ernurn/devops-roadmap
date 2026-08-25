#!/bin/bash

if grep -w -q "$2" "$1"
then
	echo "User found "$2""
else
	echo "User not found"
	echo "$1" "$2"
fi
