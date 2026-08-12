#!/bin/bash

items=(User Hostname Date Directory)

informations=("$(whoami)" "$(hostname)" "$(date +"%Y-%m-%d %H:%M:%S")" "$(pwd)")


print_sys_info() {
	for ((i=O; i<=3 ; i++))
	do
		echo "${items[i]}: ${informations[i]}              "
	done
	echo ""
}

print_sys_info

