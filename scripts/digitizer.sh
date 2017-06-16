#!/bin/sh

# Find the line in "xrandr -q --verbose" output that contains current screen orientation and "strip" out current orientation.

rotation="$(xrandr -q --verbose | grep 'connected' | egrep -o  '\) (normal|left|inverted|right) \(' | egrep -o '(normal|left|inverted|right)')"

# Using current screen orientation proceed to rotate screen and input devices.


case "$rotation" in
    normal)
    # rotate to the left
    xrandr -o left
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate ccw
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate ccw
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate ccw
    xsetwacom set "TPPS/2 IBM TrackPoint" rotate ccw
    xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0
    xinput set-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 0
    ;;

    left)
    # rotate to inverted
    xrandr -o inverted
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate half
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate half
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate half
    xsetwacom set "TPPS/2 IBM TrackPoint" rotate half
    xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0
    xinput set-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 0
    ;;
    inverted)
    # rotate to the right
    xrandr -o right
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate cw
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate cw
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate cw
    xsetwacom set "TPPS/2 IBM TrackPoint" rotate cw
    xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0
    xinput set-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 0
    ;;
    right)
    # rotate to normal
    xrandr -o normal
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate none
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate none
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate none
    xsetwacom set "TPPS/2 IBM TrackPoint" rotate none
    xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 1
    xinput set-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 1
    ;;
esac
