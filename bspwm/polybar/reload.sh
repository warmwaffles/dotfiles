#!/bin/bash

pkill polybar

polybar -c "$HOME/.config/bspwm/polybar/config.ini" left &
polybar -c "$HOME/.config/bspwm/polybar/config.ini" center &
polybar -c "$HOME/.config/bspwm/polybar/config.ini" right &
