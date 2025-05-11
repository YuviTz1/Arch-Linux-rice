#!/bin/bash

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    icon=""
elif [ "$status" = "Paused" ]; then
    icon=""
else
    echo "⏹ No Media"
    exit 0
fi

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

# Truncate long titles
text="${artist} - ${title}"
[ ${#text} -gt 50 ] && text="${text:0:47}..."

echo "$icon $text"
