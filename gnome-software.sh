#!/bin/bash

# Disable gnome-software autostart
sudo rm -f "/etc/xdg/autostart/org.gnome.Software.desktop"

# Disable gnome-software automatic updates
dconf write /org/gnome/software/download-updates false
dconf write /org/gnome/software/download-updates-notify false
