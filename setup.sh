#!/bin/bash
WHITE='\033[1;37m'
GREEN='\033[0;32m'
echo -e "${WHITE}- - - Running configs setup - - -" 
echo -e "${WHITE}- - - Do you want to install my configs? (Y/n) - - -" ; read -r configs
case "$configs" in
    [Nn]* )
	echo -e "${GREEN}Not setting up configs";;
    * )
	echo -e "${WHITE}- - - Installing vim... - - -"
	 case $(pacman -Qq vim) in
	     "vim"* )
		 echo -e "${GREEN}Vim is already installed";;
	     * )
		 pacman -S --noconfirm vim;;
	 esac
	echo -e "${WHITE}Installing alacritty..."
	 case $(pacman -Qq alacritty) in
	     "alacritty"* ) 
		 echo -e "${GREEN}Alacritty already installed";;
	     * )
		 pacman -S --noconfirm alacritty;;
	 esac
	echo -e "${WHITE}Installing git..."
	 case $(pacman -Qq git) in
	     "git"* )
		 echo -e "${GREEN}Git is already installed";;
	     * )
		 pacman -S --noconfirm git;;
	 esac
	echo -e "${WHITE}Creating git folder and cloning repository..." ; mkdir "$HOME/Git" && git clone https://github.com/rarafael/configs "$HOME/Git/configs" 
	echo -e "${WHITE}removing previous files and creating links..." ; rm -rf "$HOME/.vimrc" && ln -s "$HOME/Git/configs/.vimrc" "$HOME/.vimrc" ; ln -s /usr/bin/vim /usr/bin/vi && ln -s "$HOME/Git/configs/.config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml" &&  echo -e "${GREEN}Links made Successfully" ; sleep 1
	echo -e "${WHITE}- - - Select a shell:  - - -"
	select shell in "zsh" "dash" "keep bash"; do
	    case $shell in
		"zsh" )
		    case $(pacman -Qq zsh zsh-syntax-highlighting ) in
			"zsh" )
			    echo -e "${GREEN}zsh is already installed, proceeding to configure"
			    break;;
			* )
			    pacman -S --noconfirm extra/zsh zsh-syntax-highlighting && echo -e "${GREEN}installed zsh"
			    break;;
		    esac;;
		"dash" )
		    case $(pacman -Qq dash) in
			"dash" )
			    echo -e "${GREEN}dash is already installed, proceeding to configure"
			    break;;
			* )
			    pacman -S --noconfirm dash && echo -e "${GREEN}installed dash"
			    break;;
		    esac;;
		"keep bash" )
		    echo -e "${GREEN}keep bash :)"
		    break;;
		* )
	    esac
	done
	case $shell in
	    "zsh" )
		echo -e "${WHITE}creating .zshrc and profile"
		mkdir "$HOME/.config/zsh" && ln -s "$HOME/Git/configs/.zshrc" "$HOME/.config/zsh/.zshrc" && ln -s "$HOME/Git/configs/.zprofile" "$HOME/.zprofile" && echo -e "${GREEN}zsh links set up successfully"
		echo -e "${WHITE}setting zsh as default shell..."
		chsh -s /usr/bin/zsh && echo -e "${GREEN}zsh set up successfully";;
	    "dash" )
		echo -e "${WHITE}setting dash as default shell..."
		chsh -s /usr/bin/dash && echo -e "${GREEN}dash set up successfully";;
	    "keep bash" )
		echo -e "${WHITE}creating .bashrc..."
		rm -rf "$HOME/.bashrc" && ln -s "$HOME/Git/configs/.bashrc" "$HOME/.bashrc" && echo -e "${GREEN}bashrc links set up successfully"
		echo -e "${WHITE}setting bash as default shell..."
		chsh -s /usr/bin/bash && echo -e "${GREEN}bash set up successfully";;
	    * )
	esac && sleep 1
	echo -e "${WHITE}- - - Select Desktop Enviroment:  - - -"
	select de in "xfce" "plasma" "gnome" "none" "sway"; do
	    case $de in
		"xfce" )
		    echo -e "${WHITE}Installing xfce..." ; pacman -S --noconfirm xfce4 && echo -e "${WHITE}Select Display Manager:"
			select dm in "lightdm" "lxdm"; do
			    case $dm in 
				"lightdm" )
				    echo -e "${WHITE}Installing lightdm..." ; pacman -S --noconfirm lightdm && systemctl enable lightdm.service;;
				"lxdm" )
				    echo -e "${WHITE}Installing lxdm..." ; pacman -S --noconfirm lxdm && systemctl enable lxdm.service;;
				* )
			    esac
			done && echo -e "${GREEN}XFCE Installed successfully"
			break;;
		"plasma" )
		    echo -e "${WHITE}Installing KDE Plasma..." ; pacman -S --noconfirm plasma && systemctl enable sddm.service && echo -e "${GREEN}Plasma Installed successfully"
		    break;;
		"gnome" )
		    echo -e "${WHITE}Installing Gnome..." ; pacman -S --noconfirm gnome && systemctl enable gdm.service && echo -e "${GREEN}Gnome Installed successfully"
		    break;;
		"none" )
		    echo -e "${GREEN}No desktop enviroment installed"
		    break;;
		"sway" )
		    echo -e "${WHITE}Installing sway and setting up config..." ; pacman -S --noconfirm sway mako && ln -s "$HOME/Git/configs/.config/sway/config" "$HOME/.config/sway/config" && echo -e "${GREEN}Sway Installed successfully"
		    break;;
		* )
	    esac
	done
esac 
