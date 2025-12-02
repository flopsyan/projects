#!/usr/bin/env bash

if [[ -d "$1" && -d "$2" ]]
then
    cp -r "$1" "$2"
    exit 0
else
    if [ "$#" -ne 2 ]
    then
        echo "Please enter exactly two arguments."
        echo "Usage: $0 <OriginFolder> <DestinationPath>"
        exit 1
    else
        echo "Please use valid folder paths."
        echo "Usage: $0 <OriginFolder> <DestinationPath>"
        exit 2
    fi
fi