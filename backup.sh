#!/bin/bash

# Checa se o usuário inseriu o número correto de argumentos.
if [ $# -ne 2 ]; then
    echo "Uso correto: $0 <diretório_origem> <diretório_backup>"
    exit 1
fi
#Atribui os argumentos às variáveis de diretório.
origem="$1"
destino="$2"

# Checa se o diretório de origem fornecido em $1 existe.
if [ ! -d $origem ]; then
    echo "O diretório de origem '$origem' não existe."
    exit 1
fi

# Checa se o diretório de origem fornecido em $1 possui permissão de execução.
if [ ! -x $origem ]; then
    echo "O diretório de origem '$origem' não possui permissão de execução."
    exit 1
fi

# Checa se os arquivos dentro do diretório possuem permissão de leitura.
if [ ! -r "$origem/*" ]; then
    echo "Os arquivos no diretório de origem '$origem' não possuem permissão de leitura."
    exit 1
fi
