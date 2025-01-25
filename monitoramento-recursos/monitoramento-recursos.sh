#!/bin/bash
usoCPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
usoMemoria=$(free -m | awk 'NR==2{printf "%.2f\n", $3*100/$2}')

echo "Uso de CPU: "$usoCPU"%"
echo "Uso de memória RAM: "$usoMemoria"%"