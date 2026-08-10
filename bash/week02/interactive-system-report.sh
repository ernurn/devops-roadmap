#!/bin/bash


print_text() {
	echo "$@"
}

print_space() {
	echo ""
}

print_section() {
	echo "====================="
	echo "    SYSTEM REPORT    "
	echo "====================="
}

print_user() {
	current_user="$(whoami)"
	print_text "User: $current_user"
}

print_hostname() {
	hostname="$(hostname)"
	print_text "Hostname: $hostname"
}

print_date() {
	date="$(date +"%Y-%m-%d %H:%M:%S")"
	print_text "Date: $date"
}

print_path() {
	path="$(pwd)"
	print_text "Current directory: $path"
}

while true
do
	read -p "Show system information? (y/n): " option
	if [ "$option" == "y" ] 
	then
		#funciones
		print_space
		print_section
		print_space
		print_user
		print_hostname
		print_date
		print_path
		print_space
		break
	elif [ "$option" == "n" ]
	then	
		print_space
		print_section
		print_space
		print_text "Cancelled!"
		print_space
		break

	else
		print_text "[ERROR] Wrong option, please try again"
	fi
done
