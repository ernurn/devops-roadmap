#!/bin/bash

check_directory () {
 if [ -d $1 ]; 
   then echo "Directory exists."; 
 else
   echo "Directory not found.";
 fi  
}


check_directory /etc
check_directory /dev
check_directory /rec

