#!/bin/bash

# +------------------+ #
# | Helper functions | #
# +------------------+ #

function install_cli() {
  if brew ls --versions $1 > /dev/null
  then
    echo "Package $1 is already installed"
  else
    echo "Installing package $1"
    brew install $1
  fi
}

function install_app() {
  if brew cask ls --versions $1 &> /dev/null
  then
    echo "Package $1 is already installed"
  else
    echo "Installing package $1"
    brew cask install $1
  fi
}

# +--------------+ #
# | System setup | #
# +--------------+ #

# Check to see if Homebrew is installed, install it if not
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# Install homebrew and cask
if ! brew info cask &>/dev/null
then
  brew tap caskroom/cask
  brew install cask
fi


# +-------------------+ #
# | Install CLI Tools | #
# +-------------------+ #

echo "Installing CLI tools"

install_cli git
install_cli asdf
install_cli bat
install_cli htop
install_cli ripgrep
install_cli tig
install_cli tldr
install_cli xsv
install_cli zsh
install_cli tree
install_cli fzf
install_cli ack

# set zsh as the default shell

if [ $SHELL != '/bin/zsh' ]
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sudo chsh -s $(which zsh) $(whoami)
fi


# +-------------------+ #
# | Install CLI Tools | #
# +-------------------+ #

echo "Installing desktop applications"

install_app google-chrome
install_app firefox
install_app slack
install_app docker
install_app datagrip
install_app iterm2
install_app discord
install_app caffeine
install_app visual-studio-code


# +--------------+ #
# | Link Configs | #
# +--------------+ #

echo "Linking configs"

ln -s $(PWD)/.zshrc $HOME/.zshrc
ln -s $(PWD)/.zsh $HOME/.zsh
ln -s $(PWD)/.tmux.config $HOME/.tmux.config
ln -s $(PWD)/.vimrc $HOME/.vimrc
ln -s $(PWD)/.vim $HOME/.vim

# +----------------+ #
# | Setup SSH Keys | #
# +----------------+ #

read -p "Config SSH keys? [Y/n]" config_ssh

case $config_ssh in
  y|Y)
    # ssh-keygen
    echo "\nHere's your public key. For you know, GitHub and Stuff. \n"
    cat $HOME/.ssh/id_rsa.pub
    echo "\n"
    ;;
  n|N)
    echo "Skipping SSH keys";;
esac


# All done!
# Now switch to zsh and load ~/.zshrc
zsh
source ~/.zshrc


