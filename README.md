# dotfiles

Based on this blog post: https://www.atlassian.com/git/tutorials/dotfiles

Which in turn is based on this post: https://news.ycombinator.com/item?id=11071754

## Install dotfiles onto a new system
```shell
# 1. Add an entry to .gitignore to avoid recurision problems
echo ".cfg" >> .gitignore
> Not sure this is needed anymore...

# 2. Clone this repository
git clone --bare git@github.com:patrick-elmquist/dotfiles.git $HOME/.cfg

# 3. Define the `config` alias in the current shell
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# 4. Perform a checkout
config checkout

# 5. Don't show untracked files
config config --local status.showUntrackedFiles no
```

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

## Setup VIM
Install VIM plugins:
```shell
vim +PlugInstall +qall > /dev/null
# or alias
plug-install
```

## Dependencies
| Name                    | URL                                                                                                     |
|-------------------------|---------------------------------------------------------------------------------------------------------|
| (macOS) Homebrew        | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"         |
| Zsh-autosuggestions     | git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"             |
| Zsh-syntax-highlighting | git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting" |
| Zsh Pure prompt         | git clone git@github.com:patrick-elmquist/pure.git "$HOME/.zsh/pure"                                    |

## Homebrew
| Name                    | brew install...                                                                                         |
|-------------------------|---------------------------------------------------------------------------------------------------------|
| Imagemagick             | brew install imagemagick                                                                                |
| FFMPEG                  | brew install ffmpeg                                                                                      |
| QMK CLI                 | brew install qmk/qmk/qmk                                                                                |
| Git                     | brew install git                                                                                        |
| VIM                     | brew install vim                                                                                        |
| iTerm2                  | brew install --cask iterm2                                                                              |

## Apps
| Name                    | URL                                                                                                     |
|-------------------------|---------------------------------------------------------------------------------------------------------|
| Bat                     | https://github.com/sharkdp/bat                                                                          |

## Themes
| App     | Theme         | URL                                                                                                     |
|---------|---------------|---------------------------------------------------------------------------------------------------------|
| iTerm   | Embark        | https://github.com/embark-theme/iterm                                                                   |

## Fonts
| Name          | URL                                                                                                               |
|---------------|-------------------------------------------------------------------------------------------------------------------|
| Roboto Mono   | https://fonts.google.com/download?family=Roboto%20Mono                                                            |

