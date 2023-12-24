#
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#

# Assure zsh we can display 256 colours
export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/scripts/:$PATH

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
DISABLE_UPDATE_PROMPT=false

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# zsh-autosuggestions config
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4f4f4f'
# STRG-Space to complete
bindkey '^ ' autosuggest-accept

##Settings for umask
umask 0077


# use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

## alert me if something failed
#setopt printexitvalue

# set VI to default editor
set -o vi

# set default editor (crontab -e)
export EDITOR=/usr/bin/vim
export TERM=$TERMINAL
export FILE="lf"

## Memory overview
memusage() {
    ps aux | awk '{if (NR > 1) print $5;
                   if (NR > 2) print "+"}
                   END { print "p" }' | dc
}

# Load aliases
if [ -f $HOME/.alias ]; then
	source $HOME/.alias
fi
