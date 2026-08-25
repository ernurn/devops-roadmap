#!/bin/bash

count=$(grep -c -w "ERROR" "$1")

if (( count > 0 ))
then
	echo "Error Found!"
	echo "Errors found: $count"
else
	echo "Error not found"
fi
