#!/bin/bash

echo "================================"
echo "       DIRECTORY CHECKER        " 
echo "================================"

echo "Enter a directory (path): " && read -e DIR

if [ -d $DIR ]; then echo "Directory exist."; else echo "Directory no exist"; fi
