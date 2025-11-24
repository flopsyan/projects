#!/usr/bin/env bash

todoItems="$*"

if [ $# -eq 0 ]
then
        echo "Please enter at least one To-Do item to add"
        exit 1
else
        echo "• $todoItems" >> todolist.md
        echo "Your note \"$todoItems\" has been successfully added to your To-Do list"
        exit 0
fi
