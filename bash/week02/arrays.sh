#!/bin/bash


FRUITS=("Red Apple" "Banana" "Orange" "Grape")
echo ""
echo "First element:"
echo ${FRUITS[0]}
echo "Second element:"
echo ${FRUITS[1]}
echo "All elements:"
echo ${FRUITS[@]}
echo "elements count:"
echo ${#FRUITS[@]}

echo ""
declare -A dictionary=([Auto]="Car" [Casa]="House" [Raton]="Mouse")
echo "Array asociate:"
echo ${dictionary[Auto]}
echo ${dictionary[@]}
echo ""
echo "For in Array:"
print_array() {
	for fruit in "${FRUITS[@]}"
	do
		echo "$fruit"
	done
}

echo ""
echo "Add element:"
print_array
echo "${!FRUITS[@]}"
FRUITS+=(Mango)
print_array
echo "${!FRUITS[@]}"
echo ""
echo "Modify element:"
FRUITS[1]=PINAPLE

print_array

echo "${!FRUITS[@]}"
echo ""
echo "Delete element:"
unset FRUITS[2]
print_array

echo "${!FRUITS[@]}"
