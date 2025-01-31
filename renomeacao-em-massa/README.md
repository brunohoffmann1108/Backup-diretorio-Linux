# Renomeação de arquivos em massa (mt massa) usando BASH
**Descrição:** Dois scripts na pasta na verdade. Um é apenas pra facilitar a vida de alguém que tiver interesse (pq diabos vc ta interessado nisso mds?) 
de testar as renomeações, e o outro para renomear os arquivos em si. Senta que lá vem história.

## Como funciona
### Criação automática de arquivos
Bem simples. No diretório em que o usuário está, passe os 2 argumentos: número de arquivos criados e nome base. O resultado será, no diretório alvo, a quantidade de arquivos nomeados com o nome base seguidos do número, de zero ao tanto de arquivos que tu quis criar. Tu q manda chef. Tem uma mensagenzinha de feedback também (ela tem corzinha). Exemplo: `./criacao-arquivos.sh 10 arquivo`

### Renomeação de arquivos
Depois de criar automáticamente 