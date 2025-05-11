#!/bin/bash

# Set HDMI-1 as primary and place eDP-1 to the right of it
xrandr \
  --output HDMI-1 --primary --auto --pos 0x0 \
  --output eDP-1 --auto --right-of HDMI-1
