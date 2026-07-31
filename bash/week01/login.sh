#!/bin/bash

echo "==========================="
echo "           LOGIN           "
echo "==========================="

echo ""
echo "Username: " && read -e USERNAME

if [ $USERNAME == $USER ]; then echo "Welcome back."; else echo "Unknow user!"; fi

echo ""
