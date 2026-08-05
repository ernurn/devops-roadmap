#!/bin/bash

CURRENT_DIRECTORY=$(pwd)
USERS=$(ls /home)
FILES=$(ls "$CURRENT_DIRECTORY")

print_header() {
	echo "========================="
}

print_title() {
	echo "$1"
}

print_space() {
	echo ""
}

list_directory() {
	print_title "Current Directory: "$CURRENT_DIRECTORY""
	print_space
	for FILE in $FILES ;
	do
		echo "$FILE";
	done
}

list_users() {
	print_title "Users:"
	print_space
	for ITEM in $USERS;
	do
		echo "$ITEM";
	done
}

print_header
print_title "      SYSTEM SUMMARY"
print_header
print_space
list_directory
print_space
list_users
print_space
print_title "Finished."
