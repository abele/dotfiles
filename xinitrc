#!/bin/bash
# Taken from:
#	https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc
#
# Restore last wallpaper
nitrogen --restore &

xset -b # disable bell
eval `/usr/bin/ssh-agent`

SSH_ASKPASS=x11-ssh-askpass ssh-add < /dev/null

xmodmap ~/.Xmodmap

xrdb -merge $HOME/.Xresources

# Use both screens
xrandr --output VGA-1 --right-of DVI-I-1

exec awesome
