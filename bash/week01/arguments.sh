#!/bin/bash

echo "======================"
echo "      ARGUMENTS       "
echo "======================"

echo ""
if [ $# -ne 0 ]; then echo "Hello $1!"; else echo "Without arguments"; fi
echo "$#"
echo "$@"
echo ""


