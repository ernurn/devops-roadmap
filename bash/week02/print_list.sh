#!/bin/bash

fruits=("Red Apple" "Banana" "Orange" "Grape")

print_items() {
	for item in "$@" 
	do	
		echo "$item"
	done
}

print_items "${fruits[@]}"
