#!/bin/bash

# Disable gnome-software autostart
rm -f "/etc/dxg/autostart/org.gnome.Software.desktop"

# Disable gnome-software automatic updates
dconf write /org/gnome/software/download-updates false
dconf write /org/gnome/software/download-updates-notify false
