#!/bin/sh

set -e

WHITE='\033[1;37m' ; GREEN='\033[0;32m' ; NOCOLOR='\033[0m'
printf "\nInstalling packages...\n${NOCOLOR}" ; pacman -S --noconfirm --quiet --needed vim alacritty git zsh zsh-syntax-highlighting sway swaylock dunst waybar vifm zathura zathura-pdf-mupdf imv mpv ncdu xorg-xwayland bemenu wl-clipboard jq grim slurp btop firefox steam discord pacman-contrib fd man-pages noto-fonts-cjk
mkdir -v "$HOME/Git"
git clone https://github.com/rarafael/configs "$HOME/Git" ; git pull
curl -o "$HOME/Git/configs/.config/vifm/colors/gruvbox.vifm" "https://raw.githubusercontent.com/vifm/vifm-colors/master/gruvbox.vifm"
printf "\n${WHITE}Making links...${NOCOLOR}"
mkdir -v "$HOME/.local/bin"
mkdir -v "$HOME/Documents/screenshots"
ln -sv /usr/bin/vim /usr/bin/vi
ln -sfv "$HOME/Git/configs/.config/alacritty" "$HOME/.config/alacritty"
ln -sfv "$HOME/Git/configs/.vimrc" "$HOME/.vimrc"
ln -sfv "$HOME/Git/configs/.zprofile" "$HOME/.zprofile"
ln -sfv "$HOME/Git/configs/.config/zsh" "$HOME/.config/zsh" && chsh -s /usr/bin/zsh "$(id -u -n 1000)"
ln -sfv "$HOME/Git/configs/.config/sway" "$HOME/.config/sway"
ln -sfv "$HOME/Git/configs/.config/dunst" "$HOME/.config/dunst"
ln -sfv "$HOME/Git/configs/.config/waybar" "$HOME/.config/waybar"
ln -sfv "$HOME/Git/configs/.config/vifm" "$HOME/.config/vifm"
ln -sfv "$HOME/Git/configs/.config/rofi" "$HOME/.config/rofi"
cp -v "/usr/share/sway/scripts/grimshot" "$HOME/.local/bin/grimshot" && mkdir "$HOME/Documents/screenshots"
mkdir "$HOME/.local/share/fonts"
curl -o "$HOME/.local/share/fonts/Iosevka.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip" && 7z x Iosevka.zip && fc-cache && rm "$HOME/.local/share/fonts/Iosevka.zip"
printf "\n${GREEN}Installation successfull"
printf "\n${WHITE}Would you like to reboot? (Y/n) " ; read -r yn ; case $yn in
[] | [Yy]* )
    printf "\nRebooting in 6 seconds..." ; sleep 6 && reboot;;
* )
    printf "\nNot rebooting" && exit 0 ;;
esac
