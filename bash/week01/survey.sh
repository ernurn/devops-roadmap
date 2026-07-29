#!/bin/bash

echo "What is your name?"
read -e NAME
echo "How old are you?"
read -e AGE
echo "What is your favorite Linux Distribution?"
read -e DISTRIBUTION
echo "What is your goal?"
read -e GOAL

echo "========================"
echo "         SUMMARY        "
echo "========================"

echo ""
echo "Name: $NAME"
echo "Age: $AGE"
echo "Distribution: $DISTRIBUTION"
echo "Goal: $GOAL"
