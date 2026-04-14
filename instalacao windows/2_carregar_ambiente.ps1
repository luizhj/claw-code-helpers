
#plataforma deepseek usando interface anthropic
$env:ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
$env:ANTHROPIC_MODEL="deepseek-chat"
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-chat"
$env:API_TIMEOUT_MS=600000
$env:CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
$env:ANTHROPIC_API_KEY="sk-34c4...8f12"

# arquivo com chave fora do repositorio git
Invoke-Expression "c:\dev\claw-code-ambiente.ps1"

Write-Host "Variáveis de ambiente carregadas."