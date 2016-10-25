#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="$HOME/.config"

# If you are root...don't run this...it would be retarded
# plus it keeps bitching at me and I don't want to fix it
#if [[ ${EUID} != 0 ]];
#then
#  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# All my colors
TEXT_BLACK='\e[0;30m'   # Black - Regular
TEXT_RED='\e[0;31m'     # Red
TEXT_GREEN='\e[0;32m'   # Green
TEXT_YELLOW='\e[0;33m'  # Yellow
TEXT_BLUE='\e[0;34m'    # Blue
TEXT_PURPLE='\e[0;35m'  # Purple
TEXT_CYAN='\e[0;36m'    # Cyan
TEXT_WHITE='\e[0;37m'   # White
BOLD_BLACK='\e[1;30m'   # Black - Bold
BOLD_RED='\e[1;31m'     # Red
BOLD_GREEN='\e[1;32m'   # Green
BOLD_YELLOW='\e[1;33m'  # Yellow
BOLD_BLUE='\e[1;34m'    # Blue
BOLD_PURPLE='\e[1;35m'  # Purple
BOLD_CYAN='\e[1;36m'    # Cyan
BOLD_WHITE='\e[1;37m'   # White
UND_BLACK='\e[4;30m'    # Black - Underline
UND_RED='\e[4;31m'      # Red
UND_GREEN='\e[4;32m'    # Green
UND_YELLOW='\e[4;33m'   # Yellow
UND_BLUE='\e[4;34m'     # Blue
UND_PURPLE='\e[4;35m'   # Purple
UND_CYAN='\e[4;36m'     # Cyan
UND_WHITE='\e[4;37m'    # White
BACK_BLACK='\e[40m'     # Black - Background
BACK_RED='\e[41m'       # Red
BACK_GREEN='\e[42m'     # Green
BACK_YELLOW='\e[43m'    # Yellow
BACK_BLUE='\e[44m'      # Blue
BACK_PURPLE='\e[45m'    # Purple
BACK_CYAN='\e[46m'      # Cyan
BACK_WHITE='\e[47m'     # White
COLOR_OFF='\033[00m'    # Text Reset

# Used for the PS1 below
USER_NAME=$BOLD_RED
WORKING_DIR=$BOLD_CYAN
GIT_BRANCH=$BOLD_RED

if [[ ${EUID} != 0 ]];
then
  USER_NAME=$BOLD_GREEN
fi

function parse_dirty_branch() {
  [[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]]
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1)/"
}

export PS1="\[$TEXT_YELLOW\]\t\[$COLOR_OFF\] \[$USER_NAME\]\u\[$COLOR_OFF\]@\[$WORKING_DIR\]\w\[$COLOR_OFF\]\[${BOLD_RED}\]\$(parse_git_branch)\[$COLOR_OFF\] : "
export PS2="> "
export PS3="> "
export PS4="+ "

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias grep='grep --color=auto'

alias b='cd ../'
alias push='git push origin'
alias co='git checkout'
alias gs='git status'
alias gb='git branch'
alias gr='git ls-files --deleted | xargs git rm'
alias gf='git fetch'
alias gti='git'
alias be='bundle exec'
alias unixtime='date -u +%s'
alias subl='subl3'

# Docker utilities
alias comp='docker-compose'
alias reown='sudo chown -R warmwaffles:warmwaffles'
alias d='docker'
alias cr='docker-compose run'
alias cu='docker-compose up'

alias shrug="echo '¯\\_(ツ)_/¯'"

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="vim"
export BUNDLER_EDITOR='subl'

export NVM_DIR="$HOME/.nvm"

# Java Bullshit
export ANDROID_HOME="/opt/android-sdk"
export JAVA_HOME="/usr/lib/jvm/default"

export BUILDDIR="/usr/local/pkgs"

export CHEATCOLORS=true

eval $(dircolors -b $HOME/.dircolors)

docker() {
  if command -v "docker-$1" > /dev/null 2>&1; then
    subcommand=$1
    shift
    docker-$subcommand $@
  else
    $(which docker) $@
  fi
}

source /usr/share/nvm/init-nvm.sh

man() {
  # env LESS_TERMCAP_mb=$'\E[01;31m' \
  # LESS_TERMCAP_md=$'\E[01;38;5;74m' \
  # LESS_TERMCAP_me=$'\E[0m' \
  # LESS_TERMCAP_se=$'\E[0m' \
  # LESS_TERMCAP_so=$'\E[38;5;246m' \
  # LESS_TERMCAP_ue=$'\E[0m' \
  # LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  # man "$@"
  env \
    LESS_TERMCAP_md=$'\e[1;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;40;92m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
      man "$@"
}

alias open="xdg-open"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

