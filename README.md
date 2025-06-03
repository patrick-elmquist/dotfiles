# dotfiles

Based on this blog post: https://www.atlassian.com/git/tutorials/dotfiles

Which in turn is based on this post: https://news.ycombinator.com/item?id=11071754

## Dotfiles
```shell
# 1. Add an entry to .gitignore to avoid recurision problems
echo ".cfg" >> .gitignore
# TODO: Not sure this is needed anymore...

# 2. Clone this repository
git clone --bare git@github.com:patrick-elmquist/dotfiles.git $HOME/.cfg

# 3. Define the `config` alias in the current shell
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# 4. Perform a checkout
config checkout

# 5. Don't show untracked files
config config --local status.showUntrackedFiles no
```

## Homebrew
```shell
# Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Backup
brew bundle dump --force

# Restore
brew bundle install
```

## ZSH
```shell
# Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"

# Zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"

# Zsh Pure prompt
git clone git@github.com:patrick-elmquist/pure.git "$HOME/.zsh/pure"
```

## MacOS
```shell
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;
defaults write -g AppleShowScrollBars -string Always
```
## Alfred
Enable Backups by restoring an old backup, configure the Backup Workflow and run `start backups`

## VIM
```shell
# Install VIM plugins
vim +PlugInstall +qall > /dev/null

# or alias
plug-install
```

## QMK
```shell
# setup custom QMK repo
qmk setup patrick-elmquist/qmk_firmware

# ...then follow the steps in the userspace repo README

# Add these to the git config if not there already
# [submodule "keyboards/dasbob"]
# 	url = https://github.com/patrick-elmquist/qmk-config-dasbob.git
# [submodule "keyboards/totem"]
# 	url = https://github.com/patrick-elmquist/qmk-config-totem.git

```

## Error handling
If the checkout failed with...
```shell
error: The following untracked working tree files would be overwritten by checkout:
    .<SOME DOT FILE>
Please move or remove them before you can switch branches.
Aborting
```

...it means there are already old versions of some of the files.

Use the following to move the offending files to another folder:
```shell
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
