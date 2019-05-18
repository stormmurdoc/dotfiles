#
# $Id: .zshrc,v 1.81 2019/05/05 06:51:27 murdoc Exp $
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
# Personal .zshrc
#
# Author: patrick@kirchhoffs.de
#
# Configuration file: none
#
# Parameters: none
#

# Assure zsh we can display 256 colours
export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/scripts/:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set the theme
ZSH_THEME="murdoc"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Update handling
DISABLE_AUTO_UPDATE=true
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-syntax-highlighting jsontools common-aliases systemd command-not-found git themes copyfile copydir nmap extract vi-mode colored-man-pages)

source $ZSH/oh-my-zsh.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# set default User name
DEFAULT_USER="murdoc"

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

# Terminal definition
if [  $(hostname -s) != "trinity" ] && [ $(hostname -s) != "Patricks-MBP" ];then
	export TERMINAL="st"
else
	export TERMINAL="xterm-256color"
fi

# set default editor (crontab -e)
export EDITOR=/usr/bin/vim
export TERM=$TERMINAL
export BROWSER="vivaldi-snapshot"
export READER="zathura"
export FILE="ranger"
export XENVIRONMENT="~/.Xresources"

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

# Load batch.profile
if [ -f $HOME/param/batch.profile ]; then
   source $HOME/param/batch.profile
fi


# fortunes
#if [ "$(hostname)" != "trinity" ] && ( [ "$(hostname)" != "Patricks-MBP.fritz.box" || [ "$(hostname)" != "Patricks-MacBook-Pro.local" ]);then
#	echo "======================================================================="
#	fortune ~/.fortune
#	echo "======================================================================="
#fi

TMUXPROC=$(ps -ef | grep tmux | egrep -v grep | wc -l)

# start tmux session if available
#if [[ "$TMUXPROC" > 0 ]]; then
#   tmux a
#fi

if [ -f /usr/bin/neofetch ];then
	/usr/bin/neofetch
elif [ -f /usr/bin/screenfetch ];then
    /usr/bin/screenfetch
fi

# for macOS
if [ -f /usr/local/bin/screenfetch ]; then
	/usr/local/bin/screenfetch
	unalias ls
	unalias ll
	alias ll="ls -Glart"
	alias ls="ls -Glh"
fi

# fortunes
if [  $(hostname -s) != "trinity" ] && [ $(hostname -s) != "Patricks-MBP" ];then
	echo "======================================================================="
	/usr/bin/fortune ~/.fortune
	echo "======================================================================="
fi

# fish like syntax highlighting
# pacman: install zsh-syntax-highlighting
#
if [  $(hostname) = "nebukadnezar" ];then
#	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	#
	# persistent reshash for zsh
	zstyle ':completion:*' rehash true
fi

# action on host zion
if [ $(hostname) = "morpeus" ];then
#	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	 # persistent reshash for zsh
    zstyle ':completion:*' rehash true
fi

# Custom cd
 	c() {
 		cd $1;
 		ls;
 	}
# 	alias cd="c"

#-------- Fuzzy Finder {{{
#------------------------------------------------------
#
se() { /usr/bin/du -a ~/scripts/* ~/.config/* ~/workspace/* | awk '{print $2}' | fzf | xargs  -r $EDITOR ;}

# function bind to a hotkey
fzf_history() { zle -I; eval $(history | fzf +s | sed 's/ *[0-9]* *//') ; }; zle -N fzf_history; bindkey '^F' fzf_history

fzf_killps() { zle -I; ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9} ; }; zle -N fzf_killps; bindkey '^Q' fzf_killps

fzf_cd() { zle -I; DIR=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf) && cd "$DIR" ; }; zle -N fzf_cd; bindkey '^E' fzf_cd
# }}}
