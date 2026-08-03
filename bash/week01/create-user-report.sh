#!/bin/bash
HOST=$(hostname)
DATE=$(date +%Y-%m-%d_%H:%M:%S)

echo "======================"
echo "     USER REPORT      "
echo "======================"

if [ $# -ne 0 ];
then 
  echo ""
  echo "Name: $1"
  echo "Linux User: $USER"
  echo "Hostname: $HOST"
  echo "Date: $DATE"
else
  echo "[Error] without argument"
fi
echo ""
