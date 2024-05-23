#!/bin/bash

# Função para verificar se o sistema é baseado em Debian
check_debian() {
   if [ -f /etc/debian_version ]; then
       echo "Sistema é baseado em Debian."
   else
       echo "Este script é destinado apenas para sistemas baseados em Debian."
       exit 1
   fi
}

# Função para instalar o Google Chrome
install_chrome() {
   echo "Instalando Google Chrome..."
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   sudo dpkg -i google-chrome-stable_current_amd64.deb
   sudo apt-get install -f -y
}

# Função para instalar o Node.js
install_nodejs() {
   echo "Instalando Node.js..."
   curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
   sudo apt-get install -y nodejs
}

# Função para instalar o Python
install_python() {
   echo "Instalando Python..."
   sudo apt-get install -y python3
}

# Função para instalar o Visual Studio Code
install_vscode() {
   echo "Instalando Visual Studio Code..."
   wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
   sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
   rm packages.microsoft.gpg
   echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
   sudo apt-get install apt-transport-https
   sudo apt-get update
   sudo apt-get install -y code
}

# Função para instalar o Discord
install_discord() {
   echo "Instalando Discord..."
   sudo snap install discord
}

# Função para instalar o GitHub Desktop
install_github_desktop() {
   echo "Instalando GitHub Desktop..."
   sudo snap install github-desktop --beta --devmode
}

# Função para instalar o Spotify
install_spotify() {
   echo "Instalando Spotify..."
   sudo snap install spotify
}

# Função para instalar o Git
install_git() {
   echo "Instalando Git..."
   sudo apt-get install -y git
}

# Função para instalar o PHP
install_php() {
   echo "Instalando PHP..."
   sudo apt-get install -y software-properties-common
   sudo add-apt-repository ppa:ondrej/php -y
   sudo apt-get update
   sudo apt-get install -y php8.2
}

# Função para instalar o XAMPP
install_xampp() {
   echo "Instalando XAMPP..."
   wget https://www.apachefriends.org/xampp-files/8.1.10/xampp-linux-x64-8.1.10-0-installer.run
   sudo chmod +x xampp-linux-x64-8.1.10-0-installer.run
   sudo ./xampp-linux-x64-8.1.10-0-installer.run
}

# Verificar se o sistema é baseado em Debian
check_debian

# Instalar as ferramentas
install_chrome
install_nodejs
install_python
install_vscode
install_discord
install_github_desktop
install_spotify
install_git
install_php
install_xampp

echo "Instalação concluída."
