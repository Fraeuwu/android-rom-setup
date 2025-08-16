#!/bin/bash
# Autor: Faris
# Script para preparar entorno de compilación de ROM Android en Ubuntu

set -e

echo "=== Actualizando lista de paquetes ==="
sudo apt update -y

# Lista de dependencias
DEPENDENCIAS=(
    git
    repo
    openjdk-17-jdk
    ccache
    zsh
    curl
    wget
    unzip
    python3
    python3-pip
    libncurses-dev
    build-essential
)

echo "=== Verificando e instalando dependencias ==="
for paquete in "${DEPENDENCIAS[@]}"; do
    if dpkg -s "$paquete" &> /dev/null; then
        echo "[OK] $paquete ya está instalado."
    else
        echo "[INSTALANDO] $paquete..."
        sudo apt install -y "$paquete"
    fi
done

echo "=== Configurando git global ==="
read -p "Ingresa tu nombre de usuario de Git: " username
read -p "Ingresa tu email de Git: " email
git config --global user.name "$username"
git config --global user.email "$email"

echo "=== Habilitando ccache ==="
export USE_CCACHE=1
ccache -M 50G

echo "=== Entorno listo para compilar ROMs Android ==="
