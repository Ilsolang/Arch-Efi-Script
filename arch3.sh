#!/usr/bin/env bash

echo 'Сортировка зеркалов и обновление системы'
sudo pacman -Sy --noconfirm reflector
sudo reflector --verbose -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyu --noconfirm

echo 'Установка yay'
sudo pacman -Syu
sudo pacman -S --noconfirm --needed wget curl git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sri --needed --noconfirm --skippgpcheck
cd ..
sudo rm -rf yay
cd

echo 'Установка графической оболочки'
sudo pacman -S --noconfirm xfce neofetch neovim zsh flameshot htop pulseaudio firefox xfce4-settings capitaine-cursors

yay -S --noconfirm papirus-maia-icon-theme-git gtk-theme-macos-mojave firefox firefox-i18n-ru ttf-font-awesome

echo 'Установка zsh'
cd
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
