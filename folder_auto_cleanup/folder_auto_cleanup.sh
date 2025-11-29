#!/usr/bin/env bash


set -euo pipefail # exit on error, treat unset variables on errors, and fails on pipe errors


# imports the file "categories.sh"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)" # assigns the absolute path of the scripts directory to the variable CATEGORIES_DIR
source "$SCRIPT_DIR/categories.sh" # file extensions and folder names (associative array)


# check that only one argument is provided
if [ $# -ne 1 ]
then
    echo "Please enter exactly one argument."
    echo "Usage: $0 <FOLDER>"
    exit 1
fi

# sorts the files
if [ -d "$1" ] # check if folder exists
then
    for i in "$1"/*
    do
        # doesn't sort folders, just files
        [ -f "$i" ] || continue

        # checks if file is writable
        if [ -w "$i" ]
        then
            echo "Your file is writable"
        else
            echo "The file \""$(basename -- "$i")"\" is not writable." # outputs the filename without the path
        fi
    done
else
    echo "Please enter a valid PATH (avoid using ~ or \$HOME)"
    exit 2
fi










# check category for extension
# for i in 


# read file_type
# file_type="${file_type,,}" # converts all letters to lowercase
# echo "${EXT_MAP[$file_type]}"


#ext="png"
#category="${EXT_MAP[$ext]:-Other}"
#echo "$category"

#echo ${EXT_MAP[qcow2]}