#!/bin/bash

if [[ $# != 2 ]]; then
    echo -e "\e[1;31mUso correto:\e[0m $(basename "$0") <opção> <argumento_opção>"
    exit 1 
fi

OPCAO=$1
ARGUMENTO_OPCAO=$2

case "$OPCAO" in
    "listar")
        if [[ "$ARGUMENTO_OPCAO" =~ ^[0-9]+$ ]]; then
            ((ARGUMENTO_OPCAO++))
            ps -eo user,pid,%cpu,cmd --sort=-%cpu | awk '{print $1, $2, $3, $4}' | column -t | head -n $ARGUMENTO_OPCAO
        else
            echo -e "\e[1;31mUso correto:\e[0m $(basename "$0") listar <número_processos>"
            echo -e "Segundo argumento deve ser um número inteiro positivo"
        fi
    ;;
    "nome")
        RETORNO=$(ps -eo user,pid,%cpu,cmd | grep -i "$ARGUMENTO_OPCAO\|%cpu" | grep -v "grep" | grep -v "$(basename "$0")" | awk '{print $1, $2, $3, $4}' | column -t)
        if [[ -z "$RETORNO" ]]; then
            echo "Sem correspondências."
        else
            echo "$RETORNO"
        fi
    ;;
    "matar")
        kill "$ARGUMENTO_OPCAO" && echo "Processo finalizado." || echo "Erro ao tentar finalizar o processo."
    ;;
    *)
        echo -e "\e[1;31mOpção inválida.\e[0m"
        exit 1
    ;;
esac



