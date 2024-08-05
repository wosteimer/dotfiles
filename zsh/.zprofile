if [[ "$(tty)" == "/dev/tty1" && -z "$(pgrep Hyprland)" ]]; then
    exec Hyprland > /dev/null 2>&1
fi
