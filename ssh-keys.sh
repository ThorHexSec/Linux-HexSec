#!/bin/bash

# Diretório onde suas chaves estão armazenadas
CHAVES_DIR="/home/thor/Documentos/dc-ssh"

# Verifica se o primeiro argumento é -i (indicando o uso de chave)
if [[ "$1" == "-i" ]]; then
    CHAVE="$2"
    shift 2  # Remove os argumentos -i e o nome da chave da lista de argumentos
    CHAVE_PATH="$CHAVES_DIR/$CHAVE"

    # Verifica se a chave existe
    if [ ! -f "$CHAVE_PATH" ]; then
        echo "Chave $CHAVE não encontrada em $CHAVES_DIR"
        exit 1
    fi

    # Executa o comando SSH com o caminho completo da chave
    command ssh -i "$CHAVE_PATH" "$@"
else
    # Se não houver -i, executa o comando SSH normalmente
    command ssh "$@"
fi

