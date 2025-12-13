#!/bin/bash
# Manual location
LAT="22.5726"
LON="88.3639"

# TN display optimized warm-yellow settings
DAY_TEMP=6500
NIGHT_TEMP=5500          # warm yellow
DAY_BRIGHT=0.95          # slightly reduced to compensate bright bottom
NIGHT_BRIGHT=0.95        # keep consistent

# Aggressive gamma to darken whitish bottom area
# Lower values = darker, helps reduce bottom whiteness
GAMMA="0.80:0.80:0.75"    # more aggressive blue reduction

# Output name
OUTPUT="eDP-1-1"

if pgrep -x redshift > /dev/null; then
    pkill -x redshift
    xrandr --output "$OUTPUT" --gamma 1:1:1 --brightness 1
    notify-send "Redshift" "Stopped"
else
    notify-send "Redshift" "Warm Yellow (TN tuned + gradient fix)"
    redshift \
        -l ${LAT}:${LON} \
        -t ${DAY_TEMP}:${NIGHT_TEMP} \
        -b ${DAY_BRIGHT}:${NIGHT_BRIGHT} \
        -g ${GAMMA} &
fi
