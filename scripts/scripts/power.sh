#!/bin/sh

COLOR_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme)
if [[ $COLOR_SCHEME = "'prefer-dark'" ]]; then 
    rofi -show power -theme power-dark
    exit 0
fi

rofi -show power -theme power-light
