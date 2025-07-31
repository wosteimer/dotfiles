#!/bin/sh

COLOR_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme)
if [[ $COLOR_SCHEME = "'prefer-dark'" ]]; then 
rofi -show drun -sort true -show-icons -no-disable-histor -icon-theme "Papirus-Dark" -theme launcher-dark
    exit 0
fi
rofi -show drun -sort true -show-icons -no-disable-history -icon-theme "Papirus-Light" -theme launcher-light
