#!/bin/sh

function main(){
    blue=#1E66F5
    text=#4C4F69
    base=#EFF1F5
    crust=#DCE0E8
    current=$(gsettings get org.gnome.desktop.interface color-scheme)
    if [[ $current = "'prefer-dark'" ]]; then 
        blue=#89B4FA
        text=#CDD6F4
        base=#1E1E2E
        crust=#11111B
    fi 
    cat - | bemenu \
        --ch 16\
        --cw 1 \
        --fn "JetBrains Mono 12" \
        --fb $crust \
        --ff $text \
        --nb $crust \
        --nf $text \
        --af $text \
        --ab $crust \
        --tb $crust \
        --tf $blue \
        --hf $blue \
        --hb $base \
        --hp 12 \
        -i \
        -H 26 \
        -C \
        $@
}

(
    flock -n 9 || exit 1;  
    main $@ 
) 9>/tmp/bemenu.lock

