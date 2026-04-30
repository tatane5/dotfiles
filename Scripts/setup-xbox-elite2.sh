#!/usr/bin/env bash
set -e

echo "==> Installation des dépendances"
sudo pacman -S --needed bluez bluez-utils dkms linux-headers evtest joystick

echo "==> Activation de Bluetooth"
sudo systemctl enable --now bluetooth

echo "==> Vérification de xpadneo"
if ! pacman -Q xpadneo-dkms >/dev/null 2>&1; then
    echo "xpadneo-dkms non installé."
    echo "Installe-le avec : yay -S xpadneo-dkms"
    exit 1
fi

echo "==> Détection version xpadneo"
XPADNEO_VER=$(basename /usr/src/hid-xpadneo-* 2>/dev/null | sed 's/^hid-xpadneo-//')

if [ -z "$XPADNEO_VER" ]; then
    echo "Impossible de trouver /usr/src/hid-xpadneo-*"
    exit 1
fi

echo "Version détectée : $XPADNEO_VER"

echo "==> Reconstruction DKMS"
sudo dkms remove "hid-xpadneo/$XPADNEO_VER" --all || true
sudo dkms install "hid-xpadneo/$XPADNEO_VER"

echo "==> Chargement du module"
sudo modprobe hid_xpadneo

echo "==> Vérification DKMS"
dkms status

echo "==> Vérification module"
lsmod | grep xpadneo || true

echo
echo "==> OK. Il reste à :"
echo "1. redémarrer"
echo "2. refaire l'appairage bluetooth de la manette"
echo "3. tester avec : evtest"
echo "4. ouvrir Steam"
