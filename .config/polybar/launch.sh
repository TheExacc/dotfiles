#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
killall -q glava

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar on all connected monitors
if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$1" == "light" ]; then
        MONITOR=$m polybar -c $HOME/.config/polybar/light-config nord-top &
        MONITOR=$m polybar -c $HOME/.config/polybar/light-config nord-down &
    else
        MONITOR=$m polybar -c $HOME/.config/polybar/dark-config nord-top &
        MONITOR=$m polybar -c $HOME/.config/polybar/dark-config nord-down &
    fi
  done
else
  # Fallback if xrandr is not available
  if [ "$1" == "light" ]; then
      polybar -c $HOME/.config/polybar/light-config nord-top &
      polybar -c $HOME/.config/polybar/light-config nord-down &
  else
      polybar -c $HOME/.config/polybar/dark-config nord-top &
      polybar -c $HOME/.config/polybar/dark-config nord-down &
  fi
fi

# Launch glava once
glava --desktop &

echo "Bars launched..."