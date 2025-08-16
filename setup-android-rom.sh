#!/bin/bash
# Script para preparar Ubuntu 25.04 (o similar) para compilar ROMs Android
# Autor: Faris
# Fecha: $(date)

echo "=== Configuración inicial ==="
read -p "Introduce tu nombre de usuario para Git: " GIT_NAME
read -p "Introduce tu email para Git: " GIT_EMAIL

echo "=== Actualizando repositorios ==="
sudo apt update

echo "=== Instalando dependencias esenciales ==="
sudo apt install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev \
  gcc-multilib g++-multilib libc6-dev-i386 libncurses-dev x11proto-core-dev \
  libx11-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig \
  python3 ccache openjdk-17-jdk

echo "=== Configurando ccache ==="
echo 'export USE_CCACHE=1' >> ~/.zshrc
echo 'export CCACHE_EXEC=$(which ccache)' >> ~/.zshrc
source ~/.zshrc
ccache -M 50G

echo "=== Configurando Git ==="
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

echo "=== Instalando repo ==="
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
if ! grep -q 'export PATH=~/bin:$PATH' ~/.zshrc; then
    echo 'export PATH=~/bin:$PATH' >> ~/.zshrc
fi
source ~/.zshrc

echo "=== Verificando instalaciones ==="
java -version
ccache -V
git --version
repo --version

echo "=== Setup completado ==="
echo "Abre una nueva terminal para que Zsh cargue la configuración."
