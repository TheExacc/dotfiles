#!/bin/bash

# Manual location
LAT="22.5726"
LON="88.3639"

# TN display optimized warm-yellow settings
DAY_TEMP=6500
NIGHT_TEMP=5500          # warm yellow
DAY_BRIGHT=1.0
NIGHT_BRIGHT=1        # flattens TN gradient
GAMMA="0.85:0.85:0.80"    # smooth + uniform

# Output name
OUTPUT="eDP-1-1"

if pgrep -x redshift > /dev/null; then
    pkill -x redshift
    xrandr --output "$OUTPUT" --gamma 1:1:1 --brightness 1
    notify-send "Redshift" "Stopped"
else
    notify-send "Redshift" "Warm Yellow (TN tuned)"
    redshift \
        -l ${LAT}:${LON} \
        -t ${DAY_TEMP}:${NIGHT_TEMP} \
        -b ${DAY_BRIGHT}:${NIGHT_BRIGHT} \
        -g ${GAMMA} &
fi
