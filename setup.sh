#!/bin/bash 

sudo pacman -Syu --noconfirm

sudo pacman -S --needed git base-devel


if ! command -v yay &> /dev/null; then
  mkdir install && cd install
  git clone https://aur.archlinux.org/yay.git
  cd yay  
  makepkg -si
fi 

if [ -f packages.txt ]; then
  yay -S --needed --noconfirm - < packages.txt
else
  echo "Failed to find packages.txt"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo systemctl enable --now ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
