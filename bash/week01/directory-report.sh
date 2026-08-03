#!/bin/bash

echo "========================"
echo "    DIRECTORY REPORT    "
echo "========================"

if [ $# -ge 1 ]; then 
  if [ -d $1 ];
  then    
    echo "Path: $1";
    echo "Directory exists."
    echo "Items: $(ls $1 | wc -l)";
  else 
    echo "Path: $1";
    echo "Directory not found.";
  fi
else 
  echo "[ERROR] Without arguments";
fi

