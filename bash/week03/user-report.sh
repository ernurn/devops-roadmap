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

count_total() {
	total=$(awk 'END { print NR }' "$1")
}

count_actives() {
	actives=$(awk '$3 == "active" { total++ } END { print total }' "$1")
}

count_inactives() {
	inactives=$(awk '$3 == "inactive" { total++ } END { print total }' "$1")
}

count_admins() {
	admins=$(awk '$2 == "admin" { total++ } END { print total }' "$1")
}

count_regulars() {
	regulars=$(awk '$2 == "user" { total++ } END { print total }' "$1")
}


count_act_admins() {
	act_admins=$(awk '$2 == "admin" && $3 == "active" { total++ } END { print total }' "$1")
}


count_inact_admins() {
	inact_admins=$(awk '$2 == "admin" && $3 == "inactive" { total++ } END { print total }' "$1")
}

show_result() {
	print_text "================="
	print_text "   USER REPORT   "
	print_text "================="
	print_text ""
	print_text "Total users: $total"
	print_text "Active users: $actives"
	print_text "Inactive user: $inactives"
	print_text "Admins: $admins"
	print_text "Regular users: $regulars"
	print_text ""
	print_text "Active admins: $act_admins"
	print_text "Inactive admins: $inact_admins"	

}

check_file() {
	if [ -f "$1" ] 
	then
		count_total "$1"
		count_actives "$1"
		count_inactives "$1"
		count_admins "$1"
		count_regulars "$1"
		count_act_admins "$1"
		count_inact_admins "$1"
	else
		print_text "[ERROR]: file not exist"
		return 1
	fi
}

check_arguments "$@"
show_result
