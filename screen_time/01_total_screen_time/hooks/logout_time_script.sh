#!/usr/bin/env bash
current_time=$(date +%s)

echo $current_time > /home/flopsyan/Projects/screen_time/01_total_screen_time/hooks/logout_time.md
