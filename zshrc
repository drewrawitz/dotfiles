# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# default settings
ZSH_THEME="agnoster"
DEFAULT_USER="drewrawitz"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew npm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# completion
autoload -U compinit
compinit

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
cdpath=($HOME/www $HOME/www/Personal)
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# recommended by brew doctor
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"

# Increase ulimit for Gulp
ulimit -n 10240
