# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# default settings
ZSH_THEME="agnoster"
DEFAULT_USER="$USER"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast vagrant brew npm tmux pass zsh-syntax-highlighting)

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
cdpath=($HOME/www)
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

# Ansible
export ANSIBLE_HOSTS=/etc/ansible/hosts

# Increase ulimit for Gulp
ulimit -n 10240

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Aliases
  # Grep
  alias grep='grep --exclude-dir={node_modules,bower_components,vendor} --exclude=*.min.* --color=always'

  # Tmux
  alias tmux='TERM=xterm-256color; tmux'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Switch back to Vim with Ctrl+Z instead of fg
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
