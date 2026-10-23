#!/bin/bash

print_text() {
	echo "$@"
}
	
check_arguments() {
	if (( $# ))
	then
		for argument in "$@"
		do	
			check_service "$argument"
		done
	else
		print_text "[ERROR]: Without arguments"
		exit 1
	fi
}


check_service() {
	enabled=$(systemctl is-enabled "$1")
	if [ "$enabled" == "not-found" ]
        then
                print_text "[ERROR]: Service $1 not found."
                return
        fi
	active=$(systemctl is-active "$1")
	print_report "$1" "$enabled" "$active"
}

print_report() {
	print_text "================="
	print_text "  Service: "$1"  "
	print_text "================="

	print_text "Active: $3"
	print_text "Enabled: $2"
	print_text ""
}

check_arguments "$@"
