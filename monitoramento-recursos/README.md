# Monitoramento de Recursos usando BASH
**Descrição:** Script simplíssimo que realiza a leitura do uso de recursos de CPU, memória RAM e disco.

## Como utilizar
### Só usa po
É isso, só executa que o script faz o resto. Ele irá fornecer as informações de recursos, que são atualizadas a cada segundo. Para encerrar, 
só pressione CTRL + C (pelo menos no Ubuntu é assim, se não for em outras distros, se vira).

### Comportamento geral
Esse script na verdade rouba o crédito pelo trabalho dos outros. Tudo que ele faz é ler a saída de outros comandos nativos do linux (eu acho).
A diferença é que ele apresenta as informações de uma forma mais sucinta (só o que eu e você realmente queremos saber), em português e as letras
são vermelhinhas. Os comandos espoliados pela minha criação são o top (para CPU), free (memória) e df (disco). O comando awk foi de grande importância
para filtrar as saídas desses comandos e pegar só o que me importava.

## Observações finais e notas sobre a preguiça do desenvolvedor
O script é bem simples e foi feito para praticar a linguagem. Não quis fazer um sistema de LOG porque:
1. Preguiça
2. Não vi grande utilidade, já que ele é mais para uso imediato.

Outra coisa é a adição de opções, como mostrar apenas o uso de CPU, memória ou disco, individualmente. Enquanto isso na prática não seria de grande
utilidade, já que a saíde do comando é bem enxuta, seria uma ótima oportunidade de aprendizado para mim. Quem sabe um dia né.