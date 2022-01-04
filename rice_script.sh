#!/bin/sh
WHITE='\033[1;37m' ; GREEN='\033[0;32m' ; NOCOLOR='\033[0m'
printf "Installing packages...\n${NOCOLOR}" ; pacman -S --noconfirm --quiet --needed vim alacritty git sway zsh zsh-syntax-highlighting sway swayidle swaylock mako waybar ttf-joypixels ranger
git clone https://github.com/rarafael/configs "$HOME/Git/configs"
printf "\n${WHITE}Making links...${NOCOLOR}"
ln -s /usr/bin/vim /usr/bin/vi
ln -sf "$HOME/Git/configs/.config/alacritty" "$HOME/.config/alacritty"
ln -sf "$HOME/Git/configs/.config/ranger" "$HOME/.config/ranger"
ln -sf "$HOME/Git/configs/.vimrc" "$HOME/.vimrc"
ln -sf "$HOME/Git/configs/.zprofile" "$HOME/.zprofile"
ln -sf "$HOME/Git/configs/.config/zsh" "$HOME/.config/zsh" ; chsh -s /usr/bin/zsh
ln -sf "$HOME/Git/configs/.config/sway" "$HOME/.config/sway"
ln -sf "$HOME/Git/configs/.config/mako" "$HOME/.config/mako"
ln -sf "$HOME/Git/configs/.config/waybar" "$HOME/.config/waybar"
cp -v "$HOME/Git/configs/terminal_font/Px_437_IBM_VGA_8x16.ttf" "$HOME/.local/share/fonts/Px_437_IBM_VGA_8x16.ttf"
printf "\n${GREEN}Installation succesfull${NOCOLOR}\n"
printf "${WHITE}Rebooting in 6 seconds...\n" sleep 6 && reboot
