#!/bin/bash

while true; do
    # CPU:
    usoCPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    processos=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)

    # Memória RAM:
    usoMemoria=$(free -m | awk 'NR==2{printf "%.2f\n", $3*100/$2}')
    usoMemoriaGB=$(free -m | awk 'NR==2{printf "%.2f\n", $3/1000}')
    memoriaTotalGB=$(free -m | awk 'NR==2{printf "%.2f\n", $2/1000}')

    # Disco:
    usoDisco=$(df -h | awk '$NF=="/"{print $5}')
    usoDiscoGB=$(df -h | awk '$NF=="/"{print $3}')
    discoTotalGB=$(df -h | awk '$NF=="/"{print $2}')


    # Informações formatadas:
    clear
    printf "\e[1;31m5 Processos mais pesados:\e[0m\n%s\n" "$processos"
    printf "\e[1;31mUso de CPU:\e[0m %s\n" "$usoCPU%"
    printf "\e[1;31mMemória RAM em uso:\e[0m %s%% ("$usoMemoriaGB"GB de "$memoriaTotalGB"GB)\n" "$usoMemoria"
    printf "\e[1;31mUso de disco:\e[0m %s\n" "$usoDisco ("$usoDiscoGB"B de "$discoTotalGB"B)"
    sleep 1
done

