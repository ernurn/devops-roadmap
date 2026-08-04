#!/bin/bash

CURRENT_USER=$(whoami)
HOST=$(hostname)
DIR=$(pwd)

print_header () {
  echo "========================="
  echo "      SYSTEM REPORT      "
  echo "=========================";
}

show_user () {
  echo "User: $CURRENT_USER";
}

show_hostname () {
  echo "Host: $HOST";
}

show_date () {
 echo "Date: $(date +"%Y-%m-%d %H:%M:%S")";
}

show_directory () {
echo "Directory: $DIR"
}

print_header
show_user
show_hostname
show_date
show_directory
