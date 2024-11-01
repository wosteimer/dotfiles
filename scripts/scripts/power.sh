#!/bin/sh

function main(){
    OPTIONS="Desligar\nReiniciar\nSuspender\nBloquear Sessão\nEncerrar Sessão"
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
        "Bloquear Sessão")
            loginctl lock-session
            ;;
        "Encerrar Sessão")
            sway exit
            sleep 1
            loginctl terminate-session $XDG_SESSION_ID
        ;;
        *)
            echo "Ação inválida ou cancelada."
            ;;
    esac
}

main
