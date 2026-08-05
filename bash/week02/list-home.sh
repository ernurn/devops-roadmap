#!/bin/bash

LISTHOME=$(ls /home)

for ITEM in $LISTHOME; 
do
	echo $ITEM
done

