#!/bin/bash

# I would consider these packages essential or very nice to have. The GTK
# version of Vim is to get +clipboard support, you'd still run terminal Vim.
sudo apt-get update && sudo apt-get install -y \
  vim-gtk \
  tmux \
  git \
  gpg \
  curl \
  rsync \
  unzip \
  htop \
  shellcheck \
  ripgrep \
  pass \
  zsh \
  python3-pip

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

# plugins=(zsh-autosuggestions)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


rm -f .bashrc.bak && mv .bashrc .bashrc.bak
rm -f .profile.bak && mv .profile .profile.bak
rm -f .zshrc.bak && mv .zshrc .zshrc.bak
rm -f .aliases.bak && mv .aliases .aliases.bak
rm -f .gitconfig.bak && mv .gitconfig .gitconfig.bak
rm -f .tmux.conf.bak && mv .tmux.conf .tmux.conf.bak
rm -f .vimrc.bak && mv .vimrc .vimrc.bak

# Clone down this dotfiles repo to your home directory. Feel free to place
# this anywhere you want, but remember where you've cloned things to.
git clone https://github.com/nickjj/dotfiles ~/dotfiles

# Create symlinks to various dotfiles. If you didn't clone it to ~/dotfiles
# then adjust the symlink source (left side) to where you cloned it.
#
# NOTE: The last one is WSL 1 / 2 specific. No need to do this on native Linux.
mkdir -p ~/.local/bin \
  && ln -s ~/dotfiles/.aliases ~/.aliases \
  && ln -s ~/dotfiles/.bashrc ~/.bashrc \
  && ln -s ~/dotfiles/.gemrc ~/.gemrc \
  && ln -s ~/dotfiles/.gitconfig ~/.gitconfig \
  && ln -s ~/dotfiles/.profile ~/.profile \
  && ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf \
  && ln -s ~/dotfiles/.vimrc ~/.vimrc \
  && ln -s ~/dotfiles/.zshrc ~/.zshrc \
  && ln -s ~/dotfiles/.local/bin/toggle-dark-mode ~/.local/bin/toggle-dark-mode \
  && sudo ln -s ~/dotfiles/etc/wsl.conf /etc/wsl.conf

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# :PlugInstall
vim +PlugInstall +qall

# Create your own personal ~/.gitconfig.user file. After copying the file,
# you should edit it to have your name and email address so git can use it.
cp ~/dotfiles/.gitconfig.user ~/.gitconfig.user

# Install FZF (fuzzy finder on the terminal and used by a Vim plugin).
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Install ASDF (version manager which I use for non-Dockerized apps).
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8

# Install Node through ASDF.
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 12.17.0
asdf global nodejs 12.17.0

# Install system dependencies for Ruby.
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev \
  libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev

# Install Ruby through ASDF.
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.7.1
asdf global ruby 2.7.1

# Install Ansible.
pip3 install --user ansible

# Sanity check to see if you can run some of the tools we installed.
# ruby --version
# node --version
# ansible --version

# Check to make sure git is configured with your name, email and custom settings.
git config --list

# If you're using Docker Desktop with WSL 2, these should be accessible too.
# docker info
# docker-compose --version