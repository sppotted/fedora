#!/bin/bash

# Dnf flags
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

# Install gnome with login manager and basic packages
sudo dnf install									\
gnome-shell gnome-terminal gnome-system-monitor		`#gnome essentials`		\
gnome-disk-utility baobab                       	`#disk managment`              	\
nautilus gnome-text-editor gnome-calculator       	`#file managment`         	\
xdg-user-dirs xdg-user-dirs-gtk				`#user folders`			\
gnome-software 						`#download and install apps`	\
gnome-tweaks						`#extra gnome customization`	\
epiphany 		  				`#web browser`            	\
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

# Adding flatpak repo & gnome extensions app
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Adding rpmfusion repo
sudo dnf install fedora-workstation-repositories -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf upgrade --refresh -y
sudo dnf groupupdate core -y
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install dnf-plugins-core -y

# Install media codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia -y
