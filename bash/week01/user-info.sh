#!/bin/bash

echo "What is your name?" 
read -e NAME
echo "Where are you from?" 
read -e COUNTRY


echo "==========================="
echo "        USER PROFILE       "
echo "==========================="
echo ""
echo "Name: $NAME"
echo "Country: $COUNTRY"
echo ""
echo "Linux user: $USER"
echo "Hostname: $HOSTNAME"
echo "Home: $HOME"

