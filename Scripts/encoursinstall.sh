#!/bin/bash
set -e

echo "==> Mise à jour système"
sudo pacman -Syu --noconfirm

echo "==> Installation des paquets de base"
bash packages.sh

echo "==> Installation des configs"
cd ~/dotfiles || exit 1
stow --restow fish
stow --restow gtk
stow --restow hyprland
stow --restow icons
stow --restow kitty
stow --restow rofi
stow --restow waybar











chmod 700 ~/.ssh
chmod 600 ~/.ssh/config

echo "==> Activation du ssh-agent"
systemctl --user enable --now ssh-agent.service

echo "==> Shell par défaut -> fish"
chsh -s /usr/bin/fish

echo "==> Configuration Git"
git config --global user.name "TonNom"
git config --global user.email "tonemail@example.com"

echo "==> Génération clé SSH (si absente)"
if [ ! -f ~/.ssh/id_ed25519 ]; then
  ssh-keygen -t ed25519 -C "tonemail@example.com"
fi

echo "==> Chargement clé SSH"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
ssh-add ~/.ssh/id_ed25519 || true

echo "==> Installation terminée"
echo "Pense à copier ~/.ssh/id_ed25519.pub dans GitHub > Settings > SSH Keys"