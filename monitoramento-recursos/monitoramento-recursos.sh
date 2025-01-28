#!/bin/bash

#Data atual.
dataAtual=$(date +"%d-%m-%Y_%H:%M:%S")

#Uso de CPU em porcentagem.
usoCPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

#Processos mais pesados.
processos=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)

#Uso de memória em porcentagem.
usoMemoria=$(free -m | awk 'NR==2{printf "%.2f\n", $3*100/$2}')

#Uso de disco em porcentagem.
usoDisco=$(df -h | awk '$NF=="/"{print $5}')

printf "MONITORAMENTO DE RECURSOS %s\n" "$dataAtual"
printf "Uso de CPU: %s\n" "$usoCPU%"
printf "5 Processos mais pesados:\n%s\n" "$processos"
printf "Memória RAM em uso: %s%%\n" "$usoMemoria"
printf "Uso de disco: %s\n" "$usoDisco"

