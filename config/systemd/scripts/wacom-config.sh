#!/bin/sh
for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

stylus=$(xsetwacom list devices | awk '/stylus/ {print $9}')


xsetwacom set $stylus MapToOutput 1920x1080+0+0
xsetwacom set $stylus Area 0 0 15200 8550
