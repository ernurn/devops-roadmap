#!/bin/bash

servers=(server01 server02 server03 server04)

check() {
	for server in "$@"
	do
		echo "Checking $server"
	done

}

check ${servers[@]}
