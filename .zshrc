#!/bin/zsh

#-------------------------------------------------
# DEPENDENCIES
#
# Install Pure Prompt
# https://github.com/sindresorhus/pure#manually
#
# Install zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
#
# Install zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#in-your-zshrc
#-------------------------------------------------

unsetopt PROMPT_SP

export EDITOR='vim'

case "$OSTYPE" in
  darwin*)
    # Let Homebrew installs take priority
    export PATH="/usr/local/sbin:$PATH"
    # Make sure Gradle use the same Java version as Android Studio
    export JAVA_HOME='/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home'
    ;;
  linux*)
    # TODO export JAVA_HOME=''
    ;;
esac


# Pure Prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=$
zstyle :prompt:pure:path color yellow
prompt pure


# Auto completion
autoload -Uz compinit
case "$OSTYPE" in
  darwin*)
    # TODO this solution only works for Mac, need an OS specific part
    if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
      compinit
    else
      compinit -C
    fi
    ;;
  linux*)
    if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
      compinit;
    else
      compinit -C;
    fi
    ;;
esac


# Add case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Make sure the SSH agent is running
eval "$(ssh-agent -s)" > /dev/null 2>&1

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Source dotfiles
source ~/.aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local

source ~/.functions
[[ -f ~/.functions.local ]] && source ~/.functions.local

