#!/bin/bash

checa_diretorio() {
    local diretorio="$1"
    # Realiza o processo de validar permissões em cada arquivo do diretório atual.
    for arquivo in "$diretorio"/*; do
        if [ -d "$arquivo" ]; then
            if [ ! -x "$arquivo" ]; then
                echo "O subdiretório '$arquivo' não possui permissão de execução."
                exit 1
            fi
            # Se o arquivo for um diretório, cria ele na pasta de backup também
            local novo_diretorio="$2/$(basename "$arquivo")"
            mkdir "$novo_diretorio"
            echo "Subdiretório copiado: $arquivo" >> "$novo_backup"/backup.log
            # Além disso, chama a função em recursão para analisar cada arquivo desse subdiretório.
            checa_diretorio "$arquivo" "$novo_diretorio"
        elif [ -f "$arquivo" ]; then
            if [ ! -r "$arquivo" ]; then
                echo "O arquivo '$arquivo' não possui permissão de leitura."
                # Remove a pasta raíz do backup, cancelando o processo.
                rm -r "$novo_backup"
                exit 1
            fi
            # Copia o arquivo atual para o subdiretório analisado.
            cp "$arquivo" "$2"
            echo "Arquivo copiado: $arquivo" >> "$novo_backup"/backup.log
        fi
    done

}

# Checa se o usuário inseriu o número correto de argumentos.
if [ $# -ne 2 ]; then
    echo "Uso correto: $0 <diretório_origem> <diretório_backup>"
    exit 1
fi
#Atribui os argumentos às variáveis de diretório.
origem="$1"
destino="$2"

# Checa se o diretório de origem fornecido em $1 existe.
if [ ! -d "$origem" ]; then
    echo "O diretório de origem '"$origem"' não existe."
    exit 1
fi

# Checa se o diretório de origem fornecido em $1 possui permissão de execução.
if [ ! -x "$origem" ]; then
    echo "O diretório de origem '$origem' não possui permissão de execução."
    exit 1
fi

# Checa se o diretório de destino fornecido em $2 existe. Se não existe, cria automaticamente.
if [ ! -d "$destino" ]; then
    echo "O diretório de destino fornecido não existe. Portanto, será criado automaticamente."
    mkdir "$destino"

# Checa se o diretório de destino fornecido em $2 possui permissão de execução.
elif [ ! -x "$destino" ]; then
    echo "O diretório de destino '"$destino"' não possui permissão de execução."
    exit 1

# Checa se o diretório de destino fornecido em $2 possui permissão de escrita.
elif [ ! -w "$destino" ]; then
    echo "O diretório de destino '"$destino"' não possui permissão de escrita."
    exit 1
fi

# Cria o diretório do backup atual no diretório de destino.
novo_backup="$destino"/"$(date +"%d-%m-%y %H:%M":%S)"
mkdir "$novo_backup"

echo "Data e hora: $(date +"%d-%m-%Y %H:%M:%S")" >> "$novo_backup"/backup.log
echo "De: $origem" >> "$novo_backup"/backup.log
echo "Para: $destino" >> "$novo_backup"/backup.log
echo " " >> "$novo_backup"/backup.log
echo " " >> "$novo_backup"/backup.log
checa_diretorio "$origem" "$novo_backup"