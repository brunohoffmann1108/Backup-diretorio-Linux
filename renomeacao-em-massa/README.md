# Renomeação de arquivos em massa (mt massa) usando BASH
**Descrição:** Dois scripts na pasta na verdade. Um é apenas pra facilitar a vida de alguém que tiver interesse (pq diabos vc ta interessado nisso mds?) 
de testar as renomeações, e o outro para renomear os arquivos em si. Senta que lá vem história.

## Como utilizar
### Criação automática de arquivos
Bem simples. No diretório em que o usuário está, passe os 2 argumentos: número de arquivos criados e nome base. O resultado será, no diretório alvo, a quantidade de arquivos nomeados com o nome base seguidos do número, de zero ao tanto de arquivos que tu quis criar. Tu q manda chef. Tem uma mensagenzinha de feedback também (ela tem corzinha). Exemplo: `./criacao-arquivos.sh 10 arquivo` cria 10 arquivos no formato arquivo1, arquivo2...

### Renomeação de arquivos
Depois de criar automáticamente os arquivos com os nomes mais obcenos possíveis, está na hora de renomeá-los. Ela também acontece no diretório em que o usuário se encontra. O script te avisará  ao rodar o código (com corzinha vermelha), e se não houverem arquivos no diretório, ele encerra e retorna um aviso (avisando). No menu, escolha sua opção, escolha o parâmetro da opção, e dale um `ls` pra ver a mágica acontecida.
1. **Prefixo** adiciona o que você escolher no começo do nome de cada arquivo.
2. **Sufixo** Adiciona ao fim, e se houver uma extensão, ela será preservada.
3. **Mudar Extensão** faz o que você acha que faz.
4. **Numerar** irá criar um padrão para os arquivos no diretório. Se você escolher que o padrão seja 'sergio_da_umbanda', os arquivos serão renomeados como sergios da umbanda indo de 0 ao número de arquivos (menos 1 (pq começa no 0)) que existem no diretório.

## Como foi feito
Para fazer esse script eu usei uma técnica chamada expansão de parâmetros, que é um nome bonito para dizer que você vai manipular o texto de uma variável. Se tiver interesse, o ChatGPT é um ótimo professor (de verdade, quem não usa tá perdendo uma mão na roda da desgraça) para praticamente qualquer tópico. Use e abuse.

## Observações finais e possíveis melhorias
Talvez criar um sistema de renomeação mais complexo, escolhendo apenas arquivos com tal extensão ou padrão no nome. Permitir renomeação baseada em datas (recomedação do gepeteco) seria algo interessante também. O script não tem tratamento de erro para falta de permissão no diretório alvo, mas se tu não tem permissão nem de mexericar nos próprios diretórios, tome vergonha na cara. Outra coisa seria adicionar uma confirmação de que o arquivo pós reomeado ainda não existe, pois será substituído caso já esteja lá. Se você chegou até aqui, parabéns por ser desocupado igual eu.