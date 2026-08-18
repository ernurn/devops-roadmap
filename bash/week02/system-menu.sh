#!/bin/bash

declare -A informations=([user]="$(whoami)" [host]="$(hostname)" [date]="$(date +"%Y-%m-%d %H:%M:%S")" [directory]="$(pwd)")

print_text() {
	echo "$@"
}

print_user() {
	print_text "User: ${informations[user]}"
}

print_hostname() {
	print_text "Hostname: ${informations[host]}"
}

print_date() {
	print_text "Date: ${informations[date]}"
}

print_directory() {
	print_text "Directory: ${informations[directory]}"
}

get_option() {
	case "$@" in
		1)
			print_user
			;;
		2)
			print_hostname
			;;
		3)
			print_date
			;;
		4)
			print_directory
			;;
		0)
			print_text "Good bye!"
			return 1
			;;
		*)
			print_text "[ERROR] Wrong option, try again!"
			;;
	esac
}

show_menu() {
while true
do
	print_text "====================="
	print_text "     SYSTEM MENU     "
	print_text "====================="
	print_text ""
	read -p "Select option:
	1- User
	2- Hostname 
	3- Date 
	4- Directory
	0- Exit
	" option 
	get_option "$option" || break
done
}

show_menu



