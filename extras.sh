#!/bin/bash

read -p "Do you want to install joplin cli? (y/N)" jpcl
if [[ $jpcl == y ]]; then

  echo "Installing joplin cli"
  sudo pacman -S --noconfirm npm
  NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
  sudo ln -s ~/.joplin-bin/bin/joplin /usr/local/bin/joplin
fi

read -p "Do you want lazy-vim? I used it to write this script :3 (y/N) " lzvm
if [[ $lzvm == y ]]; then
  sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd neovim tree-sitter curl fzf ripgrep fd kitty
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
fi

read -p "Do you want yay? (AUR helper) (y/N)" byay
if [[ $byay == y ]]; then
  sudo pacman -S --needed --noconfirm base-devel git
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  yay --version
fi

bash end.sh
