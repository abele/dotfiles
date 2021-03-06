setopt promptsubst
autoload -U promptinit
promptinit
prompt grb

autoload -U compinit
compinit

# Backslash not allways works as expected
# bindkey '^R' history-incremental-search-backward

# Add paths that should have been there by default
export PATH="/sbin:/usr/local/sbin:/usr/local/bin:~/lib/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:~/.gem/ruby/1.8/bin"
export PATH="$HOME/local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"


# Load local settings.
test -s ~/local/bin/local-settings && . ~/local/bin/local-settings || true

# Load aliases
test -s ~/.alias && . ~/.alias || true

# Fix ls colors for solarized theme
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# Add colors to less
export LESS="-R"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Use vi key bindings
bindkey -v

# Show vi mode
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Share history betwean instances
setopt inc_append_history
setopt share_history

# Load ssh env
[[ -a "$HOME/.ssh/environment" ]] && source "$HOME/.ssh/environment"

# Use vim as default editor
export EDITOR="$(which vim)"
export GIT_EDITOR="$EDITOR"
export TERMINAL="$(which sakura)"

# Setup rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Batch rename files
autoload -U zmv
alias mmv='noglob zmv -W'

# Remove man prompt for correct page
export MAN_POSIXLY_CORRECT=1

# Use antigen for ZSH plugin loading
source $HOME/.zsh/func/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv
antigen apply

# Create clean slate directory to test out ideas
function new-scratch {
    cur_dir="$HOME/scratch"
    new_dir="$HOME/Tmp/scratch-`date +'%s'`"
    mkdir -p $new_dir
    ln -nfs $new_dir $cur_dir
    cd $cur_dir
    echo "New scratch dir ready for grinding ;>"
}

export BROWSER="google-chrome-stable"

function vi-search-fix() {
    zle vi-cmd-mode
    zle .vi-history-search-backward
}

autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix

bindkey "^?" backward-delete-char

bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-chari  # Control-h also deletes the previous char
bindkey "^U" kill-line

# Python setup
export PYTHONSTARTUP="/home/abele/.config/python_startup.py"
# Load python virtualenv environment
function work(){
    ENV_NAME=$1
    source ${ENV_NAME:-venv}/bin/activate
}

#
eval "$(fasd --init auto)"

# Do not freeze terminal on Ctrl+s
stty stop ''
# Start X on login. See: http://wiki.gentoo.org/wiki/Start_X_on_login
[[ $(tty) = "/dev/tty1" ]] && exec startx

source $HOME/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-kennethreitz-SLASH-autoenv.git/activate.sh

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

export GOPATH="$HOME/go"
