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

show_config() {
	print_text ""
	print_text "ORIGINAL CONFIG:"
	cat "$1"
	backup_config "$1"
}

backup_config() {
	cp "$1" "$1.bak"
	config_update "$1"
}

config_update() {
	sed -i 's/development/production/; s/true/false/; s/8080/80/' "$1"
	show_result "$1"
}

show_result() {
	print_text ""
	print_text "CONFIG UPDATED:"
	cat "$1"
}

check_file() {
	if [ -f "$1" ] 
	then
		show_config "$1"
	else
		print_text "[ERROR]: file not exist"
		return 1
	fi
}

check_arguments "$@"
