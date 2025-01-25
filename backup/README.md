# Backup de Arquivos usando BASH
**Descrição:** Script que realiza o backup de um diretório, informado pelo usuário. Ponto. 

## Como utilizar
### Passando os argumentos
Para o script funcionar, será necessário que o usuário passe dois argumentos separados por espaço: 
1. Diretório de origem (que será copiado)
2. Diretório de destino (se o subdiretório final não existir, o script cria automáticamente)<br>
Exemplo: ./backup.sh ~/diretorio-origem ~/diretorio-backup


### Comportamento geral 
O script irá checar se o diretório de origem existe e se todos os arquivos nele possuem as permissões necessárias para serem manipulados (read se for arquivo convencional e execution se for um subdiretório). Ou seja, se for plebe nem tenta mona. Essa checagem é feita de forma recursiva.
Se o diretório de destino já existe, confirma se há permissão de escrita nele.
Se houver algum problema referente a isso, o usuário será informado por meio de uma mensagem no terminal e o processo será cancelado.

### Saída
O resultado será o seguinte: Uma pasta vai ser criada no diretório de destino. Seu nome será a data e hora exatas em que o backup foi realizado. Dentro dela, irão ter os arquivos backupados (inventei) e um log dizendo data e hora, diretórios de origem e destino, e uma grande ou pequena lista (depende de você) com os arquivos que foram copiados, filtrados como arquivos padrão ou subdiretórios. Essa lista "crua" pode ser útil para processamento, como por exemplo, passar o conteúdo do log para uma entrada de comando. Sei lá, inventa algo aí.

## Observações sobre automatização do script e outros problemas que serão (ou não) resolvidos
### Problema número 1:
O usuário perspicaz perceberá que esse script é furada de certa forma para realizar uma automatização pelo cron/acron, já que este não possui suporte para passagem automática de argumentos. Oras bolas, todo bom brasileiro sabe dar as voltas, e nesse ilustríssimo caso um wrapper script nos pode ser muito bem vindo. Apenas crie um script que executa esse lindo projetinho com os argumentos necessários, seu vadio.

### Problema número 2:
Agora o chato do usuário perspicaz vai vir dizer que a saída de erro é inútil se eu não executar o script por conta própria. É verdade, seria mais inteligente informar num arquivo de erro que as coisas não saíram como o esperado, e eu ainda pretendo fazer isso, mas no momento estou muitissimo ocupado com meu outro projeto de monitoramento de recursos. O que seria do mundo sem os chatos.
