#!/usr/bin/env bash

min=$1
max=$2

if [ $# -ne 2 ]
then
        echo "Please add exactly two numbers"
        exit 1
else
        echo $(($RANDOM % ($max - $min + 1) + $min))
        exit 0
fi
