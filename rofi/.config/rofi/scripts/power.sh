#!/usr/bin/bash

POWEROFF="Desligar"
REBOOT="Reiniciar"
SUSPEND="Suspender"
LOCK="Bloquear Tela"
LOGOUT="Encerrar Sessão"

echo -en "\0message\x1fO que deseja fazer?\n"
echo -en "\0keep-selection\x1ftrue\n"
echo -en "\0use-hot-keys\x1ftrue\n"

if [[ $ROFI_RETV -eq 1 ]]; then
    case "$@" in
        $POWEROFF)
            systemctl poweroff
            exit 0 
            ;;
        $REBOOT)
            systemctl reboot
            exit 0 
            ;;
        $SUSPEND)
            systemctl suspend
            exit 0
            ;;
        $LOCK)
            loginctl lock-session
            exit 0
            ;;
        $LOGOUT)
            killall -u william 
            sleep 1
            loginctl terminate-session $XDG_SESSION_ID
            exit 0
            ;;
        *);;
    esac
fi

case "$ROFI_RETV" in
    "10")
        echo -en "\0new-selection\x1f0\n"
        ;;
    "11")
        echo -en "\0new-selection\x1f1\n"
        ;;
    "12")
        echo -en "\0new-selection\x1f2\n"
        ;;
    "13")
        echo -en "\0new-selection\x1f3\n"
        ;;
    "14")
        echo -en "\0new-selection\x1f4\n"
        ;;
    *);;
esac

COLOR_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme)
if [[ $COLOR_SCHEME = "'prefer-dark'" ]]; then 
    echo -en "${POWEROFF}\0icon\x1fassets/shutdown-dark.svg\n"
    echo -en "${REBOOT}\0icon\x1fassets/reboot-dark.svg\n"
    echo -en "${SUSPEND}\0icon\x1fassets/suspend-dark.svg\n"
    echo -en "${LOCK}\0icon\x1fassets/lock-screen-dark.svg\n"
    echo -en "${LOGOUT}\0icon\x1fassets/log-out-dark.svg\n"
else
    echo -en "${POWEROFF}\0icon\x1fassets/shutdown-light.svg\n"
    echo -en "${REBOOT}\0icon\x1fassets/reboot-light.svg\n"
    echo -en "${SUSPEND}\0icon\x1fassets/suspend-light.svg\n"
    echo -en "${LOCK}\0icon\x1fassets/lock-screen-light.svg\n"
    echo -en "${LOGOUT}\0icon\x1fassets/log-out-light.svg\n"
fi
