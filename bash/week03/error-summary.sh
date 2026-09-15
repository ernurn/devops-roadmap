#!/bin/bash

print_text() {
	echo "$@"
}
	

check_arguments() {
	if (( $# ))
	then
		for argument in "$@"
		do	
			check_file "$argument"
		done
	else
		print_text "[ERROR]: Without arguments"
		exit 1
	fi
}

check_log() {
	print_text "$1:"
	grep -w "ERROR" "$1" | sort | uniq -c

}

check_file() {
	if [ -f "$1" ] 
	then
		print_text "file exists"
		print_text ""
		check_log "$1"
	else
		print_text "[ERROR]: file not exist"
		return 1
	fi
}

check_arguments "$@"
