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
    # removes the trailing "/"
    target_dir=${1%/}

    for i in "$target_dir"/*
    do
        if [ -d "$i" ] # checks if $i is a directory
        then
            if [ -w "$i" ] # checks if folder is writable
            then
                basename_i="${i##*/}" # basename of $i

                if [[ -v SKIP["$basename_i"] ]] # don't move folders that were created by this script (Images, PDF, Audio, ...)
                then
                    continue
                else
                    mkdir -p -- "$target_dir/Folders"
                    mv -- "$i" "$target_dir/Folders/"
                fi
            else
                echo "The folder \""$(basename -- "$i")"\" is not writable." # outputs the foldername without the full path
            fi
        else
            if [ -w "$i" ] # checks if file is writable
            then
                filename_extension=${i##*.} # extracts the filename extension
                filename_extension="${filename_extension,,}" # converts the filename extention to lowercase letters

                # checks if filename extension is in the associative array (checks if variable is defined)
                if [[ -v "EXT_MAP[$filename_extension]" ]]
                then
                    dest_dir="$target_dir/${EXT_MAP[$filename_extension]}"
                else
                    dest_dir="$target_dir/Other"
                fi

                # creates the folder and moves the file
                mkdir -p -- "$dest_dir"
                mv -- "$i" "$dest_dir/"
            else
                echo "The file \""$(basename -- "$i")"\" is not writable and could not be sorted." # outputs the filename without the full path
            fi
        fi
    done
else
    echo "Please enter a valid PATH (avoid using ~ or \$HOME)"
    exit 2
fi