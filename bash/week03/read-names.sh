#!/bin/bash

while IFS= read -r name
do
	echo "Hello $name"
done < "$@"

echo "Lines: $(wc -l < "$@")"
