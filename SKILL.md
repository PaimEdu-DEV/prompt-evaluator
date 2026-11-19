---
name: prompt-evaluator
description: Avalia de 0 a 10 um pedido de implementação VAGO antes de começar e pede só o que falta. Acione apenas quando o pedido de implementação nova ou de mudança de regra não disser onde (tela, arquivo ou print), o quê, como saber que está pronto, ou quando usar adjetivo sem referência ("melhor", "mais lúdico", "meio ruim") ou mudar regra de negócio sem a exceção. Se o pedido estiver claro, NÃO acione: implemente direto. Evaluates vague implementation requests (0-10) and asks only for what is missing; skip it when the request is already clear.
---

# Avaliador de prompt (prompt-evaluator)

O objetivo é gastar poucos tokens agora para não refazer o trabalho depois. Use só quando o pedido estiver vago. Pedido claro vai direto para a implementação, sem avaliação.

Responda sempre no idioma do usuário.

## Como avaliar (0 a 10)

Some os pontos que o pedido tem:

| Critério | Pontos | O que conta |
|---|---|---|
| **O quê** | 2 | A mudança está clara, em uma tarefa só |
| **Onde** | 2 | Diz a tela, o arquivo ou a rota, ou traz um print |
| **Regra** | 2 | Em regra de negócio, diz como funciona, por quê e a exceção |
| **Referência visual** | 1 | Em mudança de visual, traz um exemplo ou print em vez de só um adjetivo |
| **Pronto quando** | 2 | Diz como saber que acabou: testar no celular, publicar, mandar print… |
| **Restrições** | 1 | Diz o que não pode ser mexido. Se o CLAUDE.md, a memória ou o projeto já cobrem isso, o ponto conta |

Critérios que não se aplicam ao pedido (por exemplo, "Regra" numa mudança só visual) contam como cumpridos.

## Como responder

- **Nota 8 ou mais:** não pergunte nada. Escreva uma linha (`Prompt 8/10 ✓`) e implemente.
- **Abaixo de 8:** responda só isto e espere a resposta antes de ler código ou editar arquivos:

```
Prompt N/10 · antes de começar, me diga:
1. <o item mais importante que faltou, em pergunta direta>
2. <segundo item, se houver>
3. <terceiro item, se houver>
Dica: <uma frase sobre como escrever da próxima vez>
```

Faça no máximo 3 perguntas, só as que mudam o que vai ser feito. Se houver uma suposição razoável, ofereça-a dentro da pergunta para o usuário só confirmar, por exemplo: "Vale para o celular também? Eu faria nos dois."

Se o usuário disser "pode seguir", "tanto faz" ou algo parecido, implemente com as suas suposições e diga quais foram, em uma linha.

## Medição (opcional)

Para comparar o retrabalho com e sem a skill, registre os eventos num arquivo JSON Lines em `~/.claude/prompt-metrics.jsonl` (crie o arquivo se ele não existir; use o caminho equivalente no Windows: `%USERPROFILE%\.claude\prompt-metrics.jsonl`).

Depois de avaliar um pedido:
```json
{"data":"AAAA-MM-DD","projeto":"<pasta>","nota":6,"perguntou":true,"faltou":["onde","pronto"]}
```

Quando o usuário pedir ajuste numa entrega anterior (retrabalho), mesmo sem a skill ter sido acionada:
```json
{"data":"AAAA-MM-DD","projeto":"<pasta>","retrabalho":true,"motivo":"<curto>"}
```

Para comparar depois, leia esse arquivo junto com as conversas salvas em `~/.claude/projects/*/*.jsonl` (antes e depois da data de instalação). Conte os pedidos de implementação, a nota média e quantos tiveram retrabalho em cada período.
