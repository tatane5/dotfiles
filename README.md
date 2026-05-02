### Nouvelle installation :
````
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
````

#### Clone dotfiles
````
git clone https://github.com/tatane5/dotfiles.git ~/dotfiles
cd ~/dotfiles
````

### Pousser les mises à jour sur github :
```
cd ~/dotfiles
git status
git add .
git commit -m "mise à jour"
git push origin main
```
