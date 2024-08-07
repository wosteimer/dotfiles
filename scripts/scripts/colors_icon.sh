
function main(){
    sleep 0.1
    current=$(gsettings get org.gnome.desktop.interface color-scheme)
    if [[ $current = "'prefer-dark'" ]]; then 
        echo $1
    else
        echo $2
    fi
}

main $@



