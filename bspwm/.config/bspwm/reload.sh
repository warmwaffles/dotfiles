#!/bin/bash

# Reload sxhkd
pkill -USR1 -x sxhkd

# Reload polybar
polybar-msg cmd restart

xrdb -load ~/.Xresources

# Reload dunst
pkill dunst

notify-send "Reloaded sxhkd and polybar"
