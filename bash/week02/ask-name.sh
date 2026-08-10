#!/bin/bash

name=""

while [ -z "$name" ]; do read -p "Enter your name: " name;done

echo "Hello "$name"!"

