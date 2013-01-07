#!/bin/bash
# Taken from:
#	https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc
#

xset -b # disable bell

# Start ssh agent {
SSH_ENV="$HOME/.ssh/environment"
SSH_ASKPASS=x11-ssh-askpass ssh-add < /dev/null

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     source "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

# }

xmodmap ~/.Xmodmap

xrdb -merge $HOME/.Xresources

source ~/local/bin/custom-xinitrc-settings

exec awesome
