#!/usr/bin/env bash
login_time=$(last -n 1 $USER)

echo $login_time
echo $current_time
