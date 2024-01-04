#!/bin/bash

echo 'Executing dotfiles setup script...'

which zsh > /dev/null || { >&2 echo 'No zsh installation found' ; exit 1; }
which curl > /dev/null || { >&2 echo 'No curl installation found' ; exit 1; }
which git > /dev/null || { >&2 echo 'No git installation found' ; exit 1; }
which nvim > /dev/null || { >&2 echo 'No nvim installation found' ; exit 1; }

[ -f .zshrc ] && { >&2 echo 'Hey... you already have a zsh configuration'; exit 1; }

echo "\tCopying .config"
cp -r .config/ ~/

echo "\tCopying .local"
cp -r .local/ ~/

[ -f ~/.zprofile ] && ( echo '.zprofile already exists. Creating backup ~/.zprofile.bak' ; mv ~/.zprofile ~/.zprofile.bak )
ln -s ~/.config/shell/profile ~/.zprofile

echo "\tInstalling oh-my-zsh"
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

[ -f ~/.tmux.conf ] && { echo '.tmux.conf already exists. Creating backup ~/.tmux.conf.bak' ; mv ~/.tmux.conf ~/.tmux.conf.bak }
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf

echo "\tInstalling nvim plugins"

mkdir -p ~/.config/nvim/plugged/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim -c ':PlugInstall|q|q'
