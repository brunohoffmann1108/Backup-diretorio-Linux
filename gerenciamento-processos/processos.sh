#!/bin/bash

if [ $# -eq 0 ]; then
    echo -e "\e[1;31mUso correto:\e[0m $(basename "$0") <opção> <argumento_opção>"
fi

OPCAO=$1
ARGUMENTO_OPCAO=$2

case "$OPCAO" in
    "listar")

    ;;
    "nome")

    ;;
    "recursos")

    ;;
    "matar")

    ;;
    *)
        echo -e "\e[1;31mOpção inválida.\e[0m"
        exit 1
    ;;
esac

