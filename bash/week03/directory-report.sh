#!/bin/bash

declare -a directories
declare -a files
declare -a others

print_text() {
	echo "$@"
}

print_result() {
	if (( ${#directories[@]} ))
	then
		print_text "Directories: ${directories[@]}"
	else
		print_text "Directories: -"
	fi
	if (( ${#files[@]} ))
	then
		print_text "Files: ${files[@]}"
	else
		print_text "Files: -"
	fi
	if (( ${#others[@]} ))
	then
		print_text "Others: ${others[@]}"
	else
		print_text "Others: -"
	fi
		
}
	

check_arguments() {
	if (( $# ))
	then
		for argument in "$@"
		do	
			check_directory "$argument"
		done
	else
		print_text "Without arguments"
	fi
}

check_type() {
	for item in "$1"/*
	do
		value=$(basename "$item")
		if [ -d "$item" ]
		then
			directories+=( "$value" ) 
		elif [ -f "$item" ]
		then
			files+=( "$value" )
		else
			others+=( "$value" )
		fi
	done
}

check_directory() {
	if [ -d "$1" ] 
	then
		print_text "Directory exists"
		print_text ""
		check_type "$1"
	else
		print_text "Directory not exist"
	fi
}

check_arguments "$@"
print_result
