#!/bin/bash
# Taken from:
#	https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc
#

# Disable bell
xset -b
# Set mouse acceleration
xset mouse 5 0

# Load custom keyboard layouts
xmodmap ~/.Xmodmap

# Load terminal settings (colors etc)
xrdb -merge $HOME/.Xresources

# Start ssh-agent
ssh-agent-init

# Load custom settings
source ~/local/bin/custom-xinitrc-settings

# Run window manager
exec awesome
