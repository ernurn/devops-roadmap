#!/bin/bash

echo "What is your name?" 
read -e NAME

echo "========================"
echo "         WELCOME        "
echo "========================"
echo ""
echo "Welcome $NAME!"
echo ""
echo "Current session"
echo ""
echo "Linux user: $USER"
echo "Hostname: $HOSTNAME"
echo "Date: $(date +"%Y-%m-%d %H:%M:%S")"
echo ""
echo "Have a great Bash practice!"
echo ''
