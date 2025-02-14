#!/bin/bash

# Checa se o usuário inseriu o número correto de argumentos.
if [ $# -ne 1 ]; then
    echo -e "\e[1;31mO comando deve ter como argumento o diretório de origem para o backup, e nada mais\e[0m"
    exit 1
fi

# Variável para armazenar diretório de origem.
origem="$1"

# Checa se o diretório de origem fornecido em $1 existe.
if [ ! -d "$origem" ]; then
    echo -e "O diretório de origem \e[1;31m"$origem"\e[0m não existe."
    exit 1
fi

# Checa se o diretório de origem fornecido em $1 possui permissão de execução.
if [ ! -x "$origem" ]; then
    echo "O diretório de origem '$origem' não possui permissão de execução."
    exit 1
fi

# Cria o diretório do novo backup.
novo_backup="$(date +"%d-%m-%Y_%H:%M:%S")"
mkdir "$novo_backup"
# Cria o diretório para arquivos dentro do diretório de backup
diretorio_arquivos=""$novo_backup"/arquivos" 
mkdir "$diretorio_arquivos"

# Cria arquivo de log e passa algumas informações para ele acerca do backup.
echo "Data e hora: $(date +"%d-%m-%Y %H:%M:%S")" >> "$novo_backup"/backup.log
echo "De: $origem" >> "$novo_backup"/backup.log
echo "Para: "$(pwd)"" >> "$novo_backup"/backup.log
