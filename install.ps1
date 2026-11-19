# Instala a skill prompt-evaluator em %USERPROFILE%\.claude\skills\prompt-evaluator
$dest = Join-Path $env:USERPROFILE ".claude\skills\prompt-evaluator"
if (Test-Path (Join-Path $dest ".git")) { git -C $dest pull --ff-only } else { git clone https://github.com/PaimEdu-DEV/prompt-evaluator.git $dest }
Write-Output "Instalada em $dest. Abra uma nova sessão do Claude Code."
