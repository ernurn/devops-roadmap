#!/bin/bash

echo "========================"
echo "       LINUX CHECK      "
echo "========================"


echo "What is your favorite operating system?" && read -e RESP

echo ""

if [[ $RESP == "Linux" || $RESP == "linux" || $RESP == "LINUX" ]]; then echo "Excellent choice!"; else echo "Keep learning Linux!"; fi

echo ""
