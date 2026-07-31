#!/bin/bash

echo "=============================="
echo "         CHECK AGE            "
echo "=============================="
echo ""
echo "How old are you? (Only numbers)" && read -e AGE

if [ $AGE -ge 18 ]; then echo "Access garanted."; else echo "Access denied."; fi


