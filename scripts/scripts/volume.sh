#!/bin/sh

function main(){
    result=($(wpctl get-volume $1))
    if [[ ${result[2]} = "[MUTED]" ]]; then
        printf "{\"text\": \"%s mute\", \"class\": \"muted\"}\n" $5
        return 
    fi
    volume=$(python -c "print(int(${result[1]} * 100))")
    if [[ $volume -lt 25 ]]; then
        icon=$2
    elif [[ $volume -lt 50 ]]; then
        icon=$3
    else 
        icon=$4
    fi
    printf "{\"text\": \"%s %3s%%\"}\n" $icon $volume
}

main $@
