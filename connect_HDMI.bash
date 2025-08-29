#!/bin/bash

if xrandr | grep -q "HDMI-0 connected"; then
    xrandr --output HDMI-0 --auto --same-as eDP-1-1
else
    echo "HDMI-0 disconnected"
fi


