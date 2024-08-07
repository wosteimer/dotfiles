function main(){
    current=$(gsettings get org.gnome.desktop.interface color-scheme)
    if [[ $current = "'prefer-dark'" ]]; then 
        gsettings set org.gnome.desktop.interface icon-theme Papirus-Light 
        gsettings set org.gnome.desktop.interface color-scheme prefer-light
    else
        gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark 
        gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    fi
}

main $@
