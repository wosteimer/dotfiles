#!/bin/sh

function main(){
     cat - | bemenu \
        --ch 16\
        --cw 1 \
        --fn "Fira Code 11" \
        --fb "#1e1e2e" \
        --ff "#cdd6f4" \
        --nb "#1e1e2e" \
        --nf "#cdd6f4" \
        --af "#cdd6f4" \
        --ab "#1e1e2e" \
        --tb "#1e1e2e" \
        --tf "#89b4fa" \
        --hf "#1e1e2e" \
        --hb "#89b4fa" \
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

