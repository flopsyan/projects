#!/usr/bin/env bash
current_time=$(date +%s)

echo $current_time >> ~/Projects/screen_time/01_total_screen_time/hooks/login_time.md
