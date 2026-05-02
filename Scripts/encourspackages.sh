#!/bin/bash

# ===== BASE SYSTEM =====
sudo pacman -S --needed --noconfirm \
  efibootmgr \
  intel-ucode \
  sof-firmware \
  zram-generator

# ===== UTILITAIRES CLI =====
sudo pacman -S --needed --noconfirm \
  fastfetch \
  fzf \
  htop \
  nano \
  neovim \
  stow \
  wget

# ===== HYPRLAND ENV =====
sudo pacman -S --needed --noconfirm \
  hyprpaper \
  kitty \
  qt6-wayland \
  waybar \
  dunst \
  nwg-look \
  polkit-kde-agent

# ===== UTILITIES =====
sudo pacman -S --needed --noconfirm \
  nautilus


# ===== OFFICE =====
sudo pacman -S --needed --noconfirm \
  gedit \
  libreoffice-fresh \
  obsidian

# ===== OTHERS =====
sudo pacman -S --needed --noconfirm \
 keepassxc \
 postgis \
 qgis \
 steam \
 vivaldi

# ===== DEV TOOLS =====
sudo pacman -S --needed --noconfirm \
  code

# ===== FONTS =====
sudo pacman -S --needed --noconfirm \
 ttf-jetbrains-mono-nerd

 # ===== GRAPHISM MULTIMEDIA =====
sudo pacman -S --needed --noconfirm \
krita \
vlc