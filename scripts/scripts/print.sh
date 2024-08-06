#!/bin/sh

function main(){
    grim -g "$(slurp -d)"
}

(
    flock -n 9 || exit 1;  
    main  
) 9>/tmp/print.lock

