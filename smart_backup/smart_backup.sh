#!/usr/bin/env bash

echo "Please enter the folder path that you want to backup"
read source_folder

echo "Please enter the folder path where the backup should be stored"
read backup_folder

echo "Please enter the folder path where the log files should be stored"
read log_folder

source_folder_name=$(basename $source_folder)

cp -r "$source_folder" "$backup_folder"

archive_name=$(date "+%Y-%m-%d_%H-%M-%S")

tar -czf "$backup_folder"/"$archive_name".tar.gz "$backup_folder/$source_folder_name"

if [ $? -eq 0 ]
then
    rm -r "$backup_folder/$(basename $source_folder)"

else
    echo "The backup failed. Please try again."
fi