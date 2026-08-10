#!/bin/bash

print_text() {
	echo "$@"
}

print_date() {
	date=$(date +"%Y-%m-%d %H:%M:%S")
	print_text "Date: $date"
}

print_hostname() {
	host=$(hostname)
	print_text "Hostname: $host"
}

print_path() {
	current_directory=$(pwd)
	print_text "Current Directory: $current_directory"
}


while true 
do
	read -p  "1- Date | 2- Hostname | 3- Current Directory | 0- Exit " option
	if [ "$option" == 0 ]
	then
		print_text "Good Bye!"
		break
	fi

	case "$option" in
		1)
			print_date
		;;
		2)
			print_hostname
		;;
		3)
			print_path
		;;
		*)
			print_text "[ERROR] Option not available"
		;;
	esac
done
