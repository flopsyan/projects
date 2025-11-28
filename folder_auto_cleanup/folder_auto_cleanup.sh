#!/usr/bin/env bash


set -euo pipefail # exit on error, treat unset variables on errors, and fails on pipe errors


# loads the file "categories.sh"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)" # assigns the absolute path of the scripts directory to the variable CATEGORIES_DIR
source "$SCRIPT_DIR/categories.sh" # file extensions and folder names (associative array)


# source folder
if [ $# -ne 1 ]
then
    echo "Please enter exactly one argument."
    echo "Usage: $0 <FOLDER>"
    exit 1
fi

# if [ -d $1 ]
# then
#     ls -lh *
# else
#     echo "Please enter a valid PATH (refer from using ~ or \$HOME)"
#     exit 1
# fi

# check category for extension
# for i in 



# read file_type
# file_type="${file_type,,}" # converts all letters to lowercase
# echo "${EXT_MAP[$file_type]}"








#ext="png"
#category="${EXT_MAP[$ext]:-Other}"
#echo "$category"

#echo ${EXT_MAP[qcow2]}