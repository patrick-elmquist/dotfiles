#!/bin/zsh

export EDITOR='vim'
# Make sure Gradle use the same Java version as Android Studio
export JAVA_HOME='/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home'

# Workaround for weird extra line when starting Hyper Terminal
unsetopt PROMPT_SP

# Add a newline after each command
# precmd() { print "" }

# Not quite sure but I think it's needed to make Homebrew take priority
export PATH="/usr/local/sbin:$PATH:/Users/patrickelmquist/Scripts"

# Pure Prompt
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=$
zstyle :prompt:pure:path color yellow 
prompt pure

# Auto completion
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# Add case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom
source ~/.aliases
source ~/.functions

