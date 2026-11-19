# prompt-evaluator

Skill para o [Claude Code](https://claude.com/claude-code) que avalia **pedidos de implementação vagos** de 0 a 10 e pergunta só o que falta antes de começar: onde, o quê, a regra, uma referência visual, o critério de pronto e as restrições.

Pedido claro não é avaliado. Por isso a skill só custa tokens quando ajuda a evitar um retrabalho, que custa bem mais caro.

```
Prompt 5/10 · antes de começar, me diga:
1. Em qual tela fica esse painel? Se puder, mande um print.
2. "Mais lúdico" como? Tem algum app de referência?
3. Vale para o celular também? Eu faria nos dois.
Dica: diga onde, mostre um exemplo e diga quando está pronto.
```

## Instalar

### Pedindo ao próprio Claude

Cole isto numa sessão do Claude Code:

> Instale a skill deste repositório: https://github.com/PaimEdu-DEV/prompt-evaluator — clone em `~/.claude/skills/prompt-evaluator` (no Windows, `%USERPROFILE%\.claude\skills\prompt-evaluator`) e confirme que o `SKILL.md` está lá.

### Manualmente

macOS / Linux:
```bash
git clone https://github.com/PaimEdu-DEV/prompt-evaluator.git ~/.claude/skills/prompt-evaluator
```

Windows (PowerShell):
```powershell
git clone https://github.com/PaimEdu-DEV/prompt-evaluator.git "$env:USERPROFILE\.claude\skills\prompt-evaluator"
```

Ou rode o script da pasta: `./install.sh` (macOS/Linux) ou `./install.ps1` (Windows).

A skill funciona a partir da **próxima sessão** do Claude Code. Para usar só num projeto, clone em `.claude/skills/prompt-evaluator` dentro do projeto.

### claude.ai (app e site)

Baixe o repositório como ZIP e envie em **Configurações → Recursos → Skills** (é preciso ter a opção de skills ativada no plano).

## Para ela ser acionada sempre que fizer sentido (opcional)

O Claude decide sozinho quando abrir uma skill. Para reforçar, adicione ao seu `~/.claude/CLAUDE.md`:

```md
# Avaliador de prompt
- Em pedidos de implementação vagos, use a skill `prompt-evaluator` antes de começar. Em pedidos claros, implemente direto.
```

## Medir se está ajudando (opcional)

A skill registra cada avaliação e cada retrabalho em `~/.claude/prompt-metrics.jsonl`. Depois de uma ou duas semanas, peça ao Claude:

> Compare o retrabalho antes e depois de instalar a skill prompt-evaluator e me mostre num gráfico.

## Atualizar e remover

```bash
git -C ~/.claude/skills/prompt-evaluator pull     # atualizar
rm -rf ~/.claude/skills/prompt-evaluator          # remover
```

---

**English:** a Claude Code skill that scores vague implementation requests from 0 to 10 and asks only for the missing pieces (where, what, rule, visual reference, definition of done, constraints) before any code is read. Clear requests skip it entirely. Install with `git clone https://github.com/PaimEdu-DEV/prompt-evaluator.git ~/.claude/skills/prompt-evaluator`. It replies in the user's language.

Licença: MIT.
