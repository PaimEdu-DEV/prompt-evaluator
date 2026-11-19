#!/usr/bin/env sh
# Instala a skill prompt-evaluator em ~/.claude/skills/prompt-evaluator
set -e
DEST="$HOME/.claude/skills/prompt-evaluator"
if [ -d "$DEST/.git" ]; then git -C "$DEST" pull --ff-only; else git clone https://github.com/PaimEdu-DEV/prompt-evaluator.git "$DEST"; fi
echo "Instalada em $DEST. Abra uma nova sessão do Claude Code."
