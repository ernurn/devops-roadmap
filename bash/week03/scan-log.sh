#!/bin/bash


print_text() {
	echo "$@"
}

	

check_arguments() {
	if (( $# ))
	then
		for argument in "$@"
		do	
			check_directory "$argument"
		done
	else
		print_text "[ERROR] Without arguments"
		exit 1
	fi
}

check_logs() {
	print_text "Errors found:"
	for item in "$1"/*.log
	do
		if [ -f "$item" ]
		then
			value=$(basename "$item")
			count=$(grep -w -c "ERROR" "$item")
			print_text "$value: $count"
		else
			print_text "[ERROR] No .log files found"
			return 1
		fi
	done
}

check_directory() {
	if [ -d "$1" ] 
	then
		check_logs "$1"
	else
		print_text "[ERROR] Directory not exist"
		return 1
	fi
}

check_arguments "$@"
