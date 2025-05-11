#!/bin/bash

# Kill any running polybar instances
killall -q polybar

# Wait until they are all dead
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch the same bar config on both monitors
for m in HDMI-1 eDP-1; do
  MONITOR=$m polybar mainbar-xmonad &
done
