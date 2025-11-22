#!/usr/bin/env bash
login_time=$(<hooks/login_time.md)
logout_time=$(<hooks/logout_time.md)


# session time
session_duration=$(($logout_time - $login_time)) # total duration in seconds

session_time_hours=$((session_duration / 3600)) # full hours
session_time_minutes=$(((session_duration % 3600) / 60)) # remaining minutes
session_time_seconds=$((session_duration % 60)) # remaining seconds

echo The login time was $session_time_hours hours, $session_time_minutes minutes, and $session_time_seconds seconds.
