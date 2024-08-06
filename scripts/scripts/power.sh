#!/bin/sh

function main(){
    OPTIONS="Desligar\nReiniciar\nSuspender\nEncerrar Sessão"
    SELECT=$(echo -e $OPTIONS | ~/scripts/dmenu.sh -p "Escolha:")
    case $SELECT in
        "Desligar")
            systemctl poweroff
            ;;
        "Reiniciar")
            systemctl reboot
            ;;
        "Suspender")
            systemctl suspend
            ;;
        "Encerrar Sessão")
            hyprctl dispatch exit 0
            sleep 1
            loginctl terminate-session $XDG_SESSION_ID
        ;;
        *)
            echo "Ação inválida ou cancelada."
            ;;
    esac
}

main
