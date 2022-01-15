#!/bin/sh
WHITE='\033[1;37m' ; GREEN='\033[0;32m' ; NOCOLOR='\033[0m'
printf "\nInstalling packages...\n${NOCOLOR}" ; pacman -S --noconfirm --quiet --needed vim alacritty git zsh zsh-syntax-highlighting sway swaylock mako waybar ttf-joypixels ranger zathura zathura-pdf-mupdf sxiv mpv slurp ncdu xorg-xwayland p7zip dmenu wl-clipboard jq grim bashtop firefox steam discord
mkdir -v "$HOME/Git"
git clone https://github.com/rarafael/configs "$HOME/Git/configs" ; git pull
printf "\n${WHITE}Making links...${NOCOLOR}"
mkdir -v "$HOME/.local/bin"
mkdir -v "$HOME/Documents/screenshots"
ln -sv /usr/bin/vim /usr/bin/vi
ln -sfv "$HOME/Git/configs/.config/alacritty" "$HOME/.config/alacritty"
ln -sfv "$HOME/Git/configs/.config/ranger" "$HOME/.config/ranger" && xdg-mime default ranger.desktop inode/directory
ln -sfv "$HOME/Git/configs/.vimrc" "$HOME/.vimrc"
ln -sfv "$HOME/Git/configs/.zprofile" "$HOME/.zprofile"
ln -sfv "$HOME/Git/configs/.config/zsh" "$HOME/.config/zsh" && chsh -s /usr/bin/zsh "$(id -u -n 1000)"
ln -sfv "$HOME/Git/configs/.config/sway" "$HOME/.config/sway"
ln -sfv "$HOME/Git/configs/.config/mako" "$HOME/.config/mako"
ln -sfv "$HOME/Git/configs/.config/waybar" "$HOME/.config/waybar"
cp -v "/usr/share/sway/scripts/grimshot" "$HOME/.local/bin/grimshot"
cp -v "$HOME/Git/configs/terminal_font/Px_437_IBM_VGA_8x16.ttf" "$HOME/.local/share/fonts/Px_437_IBM_VGA_8x16.ttf" && fc-cache -f -v
printf "\n${GREEN}Installation succesfull"
printf "\n${WHITE}Would you like to reboot? (Y/n)" ; read -r yn ; case $yn in
[] | [Yy]* )
    printf "\nRebooting in 6 seconds..." ; sleep 6 && reboot;;
* )
    printf "\nNot rebooting" && exit 0 ;;
esac
