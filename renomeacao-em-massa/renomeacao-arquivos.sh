#!/bin/bash

# Confirmação para o usuário:
DIRETORIO=$(pwd)
echo -e "\e[1;31mDiretório modificado:\e[0m "$DIRETORIO""

# Verifica se existem arquivos no diretório:
if [ -z "$(ls "$DIRETORIO")" ]; then
    echo "Diretório vazio."
    exit 1
fi

# Menu de opções:
echo "1. Adicionar prefixo"
echo "2. Adicionar sufixo"
echo "3. Alterar extensão"
echo "4. Numerar arquivos"
read -p "Opção desejada: " OPCAO

case $OPCAO in
    1)
        read -p "Prefixo: " PREFIXO
        for ARQUIVO in "$DIRETORIO"/*; do 
            mv "$ARQUIVO" "$PREFIXO$(basename "$ARQUIVO")"
        done
    ;;
    2)
        read -p "Sufixo: " SUFIXO
        for ARQUIVO in "$DIRETORIO"/*; do
            EXTENSAO="${ARQUIVO##*.}"
            NOME="${ARQUIVO%.*}"
            if [[ "$EXTENSAO" == "$NOME" ]]; then
                mv "$ARQUIVO" "$(basename "$ARQUIVO")$SUFIXO"
            else
                mv "$ARQUIVO" "$(basename "$NOME")$SUFIXO.$EXTENSAO"
            fi
        done
    ;;
    3)
        read -p "Extensão (sem ponto): " EXTENSAO
        for ARQUIVO in "$DIRETORIO"/*; do
            NOME="${ARQUIVO%.*}"
            mv "$ARQUIVO" "$(basename "$NOME").$EXTENSAO"
        done
    ;;
    4)
        read -p "Nome padrão: " NOME
        i=0
        for ARQUIVO in "$DIRETORIO"/*; do
            mv "$ARQUIVO" "${NOME}$i"
            ((++i))
        done 
    ;;
    *)
        echo "Opção inválida."
        exit 1
    ;;
esac

echo "Feito."

