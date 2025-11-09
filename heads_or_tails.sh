#!/usr/bin/env bash

coinflip=$(($RANDOM % 2 + 1))

if [ $coinflip -eq 1 ]
then
        echo "It's Heads"
else
        echo "It's Tails"
fi
