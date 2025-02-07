# Gerenciamento de processos com BASH
A essa altura eu não precisava colocar com BASH mais em todo readme, vc já deve ter percebido. Faz uns dias que eu fiz esse script então tô meio esquecido dele, mas vamo lá. É basicamente um script para gerenciar os processos em execução no SO, e você pode (lendo código para lembrar): listar, pesquisar por nome e encerrar um processo.

## Como funciona?
Execute o script com dois argumentos: 
1. **Opção principal:** a opção do comando que você vai usar. `listar` para exibir comandos em ordem de gasto percentual de cpu, `nome` para pesquisar um processo por palavra chave e `matar` para encerrar um comando pelo PID.
2. **Argumento da opção:** para listar você escolhe um número de processor que quer ver, o nome o nome e para encerrar use o PID.  

## Como foi feito?
O monitoramento de recursos (meu outro script )era um grande roubo de outros comandos. Esse também é. Ele usa basicamente o comando `ps`juntamente com coisas como `grep`, `awk` e outros parecidos para filtrar os resultados. Ele tem uns testes para evitar erros como no caso de argumentos insuficientes, por exemplo, mas não é a coisa mais robusta do mundo. Nem do meu bairro na verdade.

## Considerações finais
### Preguiça
Sinceramente, esse deu preguiça de fazer. Foi o chatGPT que me recomendou, mas sei lá, como ele é basicamente um treino para filtrar saídas de comandos, ficou meio monótono, pois nenhum conceito novo ou realmente algo novo foi aprendido aqui. 

### Então por que fez burro?
Porque eu queria praticar fazer um comando em uma linha só. Sem exibições de menu. Agora eu faço parte do grupinho que sabe fazer isso. Aprendi alguns comandos legais na formatação dos resultados, como column, que é bem útil. Sempre aprende algo novo.
