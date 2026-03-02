#!/bin/bash 

sudo pacman -Syu --noconfirm

sudo pacman -S --needed git base-devel


if ! command -v yay &> /dev/null; then
  mkdir install && cd install
  git clone https://aur.archlinux.org/yay.git
  cd yay  
  makepkg -si
fi 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


if [ -f packages.txt ]; then
  yay -S --needed --noconfirm - < packages.txt
else
  echo "Failed to find packages.txt"
fi
