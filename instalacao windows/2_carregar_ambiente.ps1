#limpa as variaveis
$env:API_TIMEOUT_MS=$nul
$env:CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=$nul

$env:ANTHROPIC_BASE_URL=$nul
$env:ANTHROPIC_MODEL=$nul
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL=$nul
$env:ANTHROPIC_API_KEY=$nul

$env:OPENAI_BASE_URL=$nul
$env:OPENAI_API_KEY=$nul

#### plataforma api deepseek usando interface anthropic
# $env:ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
# $env:ANTHROPIC_MODEL="deepseek-chat"
# $env:ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-chat"
# $env:ANTHROPIC_API_KEY="sk-34c4...8f12"

### plataforma openrouter usando modelo gratuito google/gemma-4-31b-it
#$env:OPENAI_BASE_URL="https://openrouter.ai/api/v1"
#$env:OPENAI_API_KEY="sk-or-v1-...92bdbe22a28888e62e15107"
# claw --model google/gemma-4-26b-a4b-it:free

#### usando Open llama local
$env:OPENAI_BASE_URL="http://127.0.0.1:11434/v1"
$env:OPENAI_API_KEY="<dummy>"
# claw --model syntacticLuster/DeepSeek-Coder-V2-Lite
# claw --model qwen2.5-coder:0.5b

Write-Host "Variáveis de ambiente carregadas."