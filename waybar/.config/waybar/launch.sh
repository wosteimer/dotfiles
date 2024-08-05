#!/bin/sh

main(){
    killall waybar
    waybar &
}

main
