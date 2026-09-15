#!/bin/bash
declare -i total_scanned=0
declare -i files_with_errors=0
declare -i total_errors=0


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
	for item in "$1"/*.log
	do
		if [ -f "$item" ]
		then
			count=0
			((total_scanned++))
			(( count = $(grep -w -c "ERROR" "$item") ))
			if [ $count -ne 0 ]
			then
				(( total_errors += count ))
				(( files_with_errors++ ))
			fi
		else
			print_text "[ERROR] No .log files found"
			return 1
		fi
	done
	show_report
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

show_report() {
	print_text "=================="
	print_text "    LOG REPORT    "
	print_text "=================="
	print_text ""
	print_text "Total scanned: $total_scanned"
	print_text "Files with errors: $files_with_errors"
	print_text "Total errors: $total_errors"
	print_text ""
}

check_arguments "$@"
