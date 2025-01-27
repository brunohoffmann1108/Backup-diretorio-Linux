#!/bin/bash

#Uso de CPU em porcentagem.
usoCPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

#Uso de memória em porcentagem.
usoMemoria=$(free -m | awk 'NR==2{printf "%.2f\n", $3*100/$2}')

#Uso de disco em porcentagem.
usoDisco=$(df -h | awk '$NF=="/"{print $5}')

echo "Uso de CPU: "$usoCPU"%"
echo "Uso de memória RAM: "$usoMemoria"%"
echo "Uso de disco: "$usoDisco""