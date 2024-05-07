#!/bin/bash

# Used to reload configurations

$HOME/.config/bspwm/sxhkd/reload.sh
$HOME/.config/bspwm/polybar/reload.sh

xrdb -load ~/.Xresources
