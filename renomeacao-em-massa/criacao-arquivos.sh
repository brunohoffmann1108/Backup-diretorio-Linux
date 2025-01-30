QUANTIDADE_ARQUIVOS=$1
NOME_BASE=$2

if [ $# -eq 0 ]; then
    echo "Uso correto: $(basename "$0") <num-arquivos> <nome-base>"
    exit 1
fi

for i in $(seq 0 "$QUANTIDADE_ARQUIVOS"); do
    touch "$NOME_BASE""$i" 
done

echo -e "\e[1;31m"$QUANTIDADE_ARQUIVOS" arquivos criados em $(pwd)\e[0m"