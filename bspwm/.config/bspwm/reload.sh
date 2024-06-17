#!/bin/bash

# Reload sxhkd
pkill -USR1 -x sxhkd

# Reload polybar
polybar-msg cmd restart

xrdb -load ~/.Xresources

notify-send "Reloaded sxhkd and polybar"
