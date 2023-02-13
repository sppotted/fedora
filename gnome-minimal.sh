#!/bin/bash

# Install gnome with login manager and basic packages
sudo dnf install									\
gnome-shell gnome-terminal gnome-system-monitor		`#gnome essentials`		\
gnome-disk-utility baobab                       	`#disk managment`              	\
nautilus gnome-text-editor gnome-calculator       	`#file managment`         	\
xdg-user-dirs xdg-user-dirs-gtk				`#user folders`			\
gnome-software 						`#download and install apps`	\
gnome-tweaks						`#extra gnome customization`	\
firefox 		  				`#web browser`            	\
eog							`#simple image viewer`		\
flatpak							`#flatpak deployment framework`	\
-y 							`#automatic accept`

# Extra utilities
# sudo dnf install									\
# htop							`#terminal task manager`	\
# nvtop							`#terminal gpu task manager`	\
# neofetch						`#terminal system info`		\
# -y							`#automatic accept`

# Setting gnome interface
sudo systemctl enable gdm
sudo systemctl set-default graphical.target
