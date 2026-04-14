#!/bin/bash

# nome do container
CONTAINER_NAME="claw-code"
# nome da imagem
IMAGE_NAME="claw-code"
# caminho dos fontes protheus no wsl
PROTHEUS_PATH="/mnt/c/dev/protheus/Protheus-Vaccaro"
# chave da api do deepseek
API_KEY="$1"

# Verificar se a chave foi fornecida
if [ -z "$API_KEY" ]; then
    echo "Erro: API Key não fornecida"
    echo "Uso: $0 <API_KEY>"
    echo "Exemplo: $0 sk-c05b...cfc9"
    exit 1
fi

# executar container
  # variaveis de ambiente
  # nome da maquina rodando
  # pasta com projeto do protheus
  # nome da imagem a ser usada
docker run -it --rm \
  -e ANTHROPIC_API_KEY="$API_KEY" \
  --name "$CONTAINER_NAME" \
  -v "$PROTHEUS_PATH":/protheus \
  "$IMAGE_NAME"
