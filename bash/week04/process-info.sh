#!/bin/bash

print_text() {
	echo "$@"
}
	
check_arguments() {
	if (( $# ))
	then
		for argument in "$@"
		do	
			check_process "$argument"
		done
	else
		print_text "[ERROR]: Without arguments"
		exit 1
	fi
}


check_process() {
	processes=$(pidof "$1")
	if [ -z "$processes" ]
        then
                print_text "[ERROR]: Process $1 not found."
                return
        fi
	report=$(ps -p "$processes" -o pid,ppid,user,stat,command)
	print_report "$1" "$report"
}

print_report() {
	print_text "================="
	print_text "  Process: "$1"  "
	print_text "================="

	print_text "$2"
	print_text ""
}

check_arguments "$@"
