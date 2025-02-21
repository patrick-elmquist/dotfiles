#!/bin/zsh

unsetopt PROMPT_SP

export EDITOR='vim'
# export LC_ALL=en_US.UTF-8

case "$OSTYPE" in
  darwin*)
    # Let Homebrew installs take priority
    export PATH="/usr/local/sbin:$PATH"
    ;;
  linux*)
    ;;
esac

HISTFILE="$HOME/.zsh_history"
HISTSIZE=12000
SAVEHIST=10000
setopt append_history extended_history hist_no_store hist_ignore_all_dups hist_ignore_space inc_append_history

# # Pure Prompt
# fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
# zstyle :prompt:pure:path color yellow
# zstyle :prompt:pure:prompt:success color white
# prompt pure
# PROMPT="$PROMPT"
# prompt_newline='%666v' # hack to make it single line
# PROMPT=" $PROMPT"

# Enable VI bindings and fix backspace issue
set -o vi
bindkey "^?" backward-delete-char

# Auto completion
autoload -Uz compinit

# Improve startup time
case "$OSTYPE" in
  darwin*)
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
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Don't really remember why this should be here, moved from local
__git_files () {
    _wanted files expl 'local files' _files
}

# Source dot and local files
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

source ~/.aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local

source ~/.functions
[[ -f ~/.functions.local ]] && source ~/.functions.local

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by `pipx` on 2025-02-05 13:37:46
export PATH="$PATH:/Users/patrick.elmquist1/.local/bin"
