#if [[ "$(tty)" == "/dev/tty1" && -z "$(pgrep Hyprland)" ]]; then
#    exec Hyprland > /dev/null 2>&1
#fi
if [[ "$(tty)" == "/dev/tty1" && -z "$(pgrep sway)" ]]; then
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
    export XDG_SESSION_DESKTOP=sway
    export LIBVA_DRIVER_NAME=nvidia
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export NVD_BACKEND=direct
    exec sway --unsupported-gpu 
fi
