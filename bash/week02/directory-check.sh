#!/bin/bash

DIRECTORY=$(ls /etc)

print_section() {
	echo "========================="
	echo "     $1                  "
	echo "========================="
	echo ""
}

list_directory() {
	for ITEM in $DIRECTORY;
	do
		echo "Found: "$ITEM"";
	done
}

print_section "DIRECTORY CHECK"
list_directory

