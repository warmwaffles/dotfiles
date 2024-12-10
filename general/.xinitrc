#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING=1

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Failing to build Erlang OTP on arch
#
# This is a "hack" and no clue how to really work around this issue,
# other than setting this here.
#
# See: https://github.com/asdf-vm/asdf-erlang/issues/286#issuecomment-2093563063
export KERL_CONFIGURE_OPTIONS="--without-javac --with-odbc=/var/lib/pacman/local/unixodbc-$(pacman -Q unixodbc | cut -d' ' -f2)"

# For VSCode Keychain Issues
# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings

xsetroot -cursor_name left_ptr
nitrogen --restore
numlockx &

# Clipboard manager
# copyq &

#
# WINDOW MANAGERS
#

exec bspwm
# exec dk

# GNOME
# exec gnome-session

# Budgie
# export XDG_CURRENT_DESKTOP=Budgie:GNOME
# exec budgie-desktop

