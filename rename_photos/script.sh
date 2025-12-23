#!/usr/bin/env bash

current_user_path=$(pwd)
echo "Enter the absolute path where your photos are located... (Default is $current_user_path)"
read user_path
echo "Please enter the Prefix"
read user_prefix

if [ -z "$user_path" ] # checks if variable is empty
then
    user_path="$current_user_path"

elif [ ! -d "$user_path" ] # checks if directory exists
then
    echo "Please enter a valid absolute folder path."
    exit 1
fi

counter=1 # initilizes the counter

for photo_file in "$user_path"/*
do
    if [ -f "$photo_file" ] # only edits files; skips folders
    then
        # get EXIF data
        timestamp=$(exiv2 -g Exif.Photo.DateTimeOriginal -Pv "$photo_file") # searches for the exif metadata tag (-g Exif.Photo.DateTimeOriginal) and prints only the value (-Pv "path")
        timestamp=${timestamp:11:5} # contains five chars (from the 11th on, so only the time)
        timestamp=${timestamp/:/} # removes the colon

        file_extension="${photo_file##*.}" # gets the file extension (deletes everything to the last dot, including the dot)
        printf -v formatted_counter "%03d" $counter # saves the length of $counter to exactly 3 and adds preceeding 0s, if necessary

        new_filename="${user_prefix}-${timestamp}-${formatted_counter}.${file_extension}" # the new filename
        mv -n "$photo_file" "$user_path/$new_filename" # sets the new filename

        ((counter++)) # increases the counter by 1
    fi
done