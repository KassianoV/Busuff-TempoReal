# 🚌 BusUFF Transporte

![Framework: Flutter](https://img.shields.io/badge/Framework-Flutter-02569B?style=for-the-badge&logo=flutter)
![Language: Dart](https://img.shields.io/badge/Language-Dart-0175C2?style=for-the-badge&logo=dart)
![Status: Em Desenvolvimento](https://img.shields.io/badge/Status-Em_Desenvolvimento-orange?style=for-the-badge)

## 📝 Resumo do Projeto

O **BusUFF Transporte** é um aplicativo móvel desenvolvido com Flutter, com o objetivo de facilitar o rastreamento de ônibus que circulam nos campi da Universidade Federal Fluminense (UFF). O aplicativo oferece funcionalidades distintas para alunos e motoristas:

* **Alunos:** Podem visualizar a localização em tempo real dos ônibus em um mapa, filtrando por rotas de interesse. Isso permite otimizar o tempo de espera e planejar seus deslocamentos de forma mais eficiente.
* **Motoristas:** Através de uma interface dedicada, podem compartilhar sua localização em tempo real, permitindo que os alunos acompanhem o trajeto do ônibus.

---

## 📋 Índice

* [Configuração do Ambiente de Desenvolvimento](#-configuração-do-ambiente-de-desenvolvimento)
* [Executando o Projeto](#️-executando-o-projeto)
* [Próximos Passos e Contribuições](#-próximos-passos-e-contribuições)

---

## ⚙️ Configuração do Ambiente de Desenvolvimento

Este guia detalha os passos para configurar um ambiente de desenvolvimento completo no Windows utilizando o **Subsistema Windows para Linux (WSL)**. Clique em cada passo para expandir os detalhes.

<details>
<summary><strong>Passo 1: Instalação do WSL (Subsistema Windows para Linux)</strong></summary>

> **Atenção:** Este comando deve ser executado no **PowerShell** ou **CMD** como Administrador.

1.  Abra o **PowerShell** como Administrador.
2.  Execute o comando:
    ```powershell
    wsl --install
    ```
3.  Reinicie o computador quando solicitado e siga as instruções para criar um usuário e senha para o Ubuntu.

</details>

<details>
<summary><strong>Passo 2: Instalação das Ferramentas Essenciais e do Flutter SDK</strong></summary>

> **Atenção:** Todos os comandos a seguir devem ser executados no terminal do **Ubuntu (WSL)**.

1.  **Atualize o sistema e instale as dependências:**
    ```bash
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y git curl unzip wget openjdk-17-jdk
    ```
2.  **Baixe o Flutter SDK:**
    ```bash
    mkdir -p ~/development
    git clone [https://github.com/flutter/flutter.git](https://github.com/flutter/flutter.git) -b stable ~/development/flutter
    ```
3.  **Adicione o Flutter ao PATH** (caminho do sistema):
    ```bash
    echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.bashrc
    source ~/.bashrc
    ```
</details>

<details>
<summary><strong>Passo 3: Instalação do Android SDK (Via Linha de Comando)</strong></summary>

1.  **Crie a estrutura de pastas e baixe as ferramentas:**
    ```bash
    # Cria a estrutura de pastas
    mkdir -p ~/Android/Sdk/cmdline-tools

    # Baixa as ferramentas de linha de comando
    wget [https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip](https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip) -O ~/android-cmdline-tools.zip

    # Descompacta e organiza na estrutura correta
    unzip ~/android-cmdline-tools.zip -d ~/Android/Sdk/cmdline-tools
    mv ~/Android/Sdk/cmdline-tools/cmdline-tools ~/Android/Sdk/cmdline-tools/latest
    rm ~/android-cmdline-tools.zip
    ```
2.  **Configure as variáveis de ambiente do Android** (adiciona em ambos `.bashrc` e `.profile` para garantir):
    ```bash
    tee -a ~/.bashrc ~/.profile > /dev/null <<EOT

# Android SDK
export ANDROID_HOME="\$HOME/Android/Sdk"
export PATH="\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="\$PATH:\$ANDROID_HOME/platform-tools"
EOT
    
    # Recarrega as configurações no terminal atual
    source ~/.profile
    ```
3.  **Instale os pacotes do SDK e aceite as licenças:**
    ```bash
    yes | sdkmanager --licenses
    sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"
    ```
</details>

<details>
<summary><strong>Passo 4: Configuração do VS Code e Flutter Web</strong></summary>

1.  **Instale o VS Code** no Windows a partir do [site oficial](https://code.visualstudio.com/).
2.  **Instale a extensão "Flutter"** (publicada por Dart-Code) no VS Code.
3.  **Configure o Flutter** para reconhecer o SDK do Android e habilitar o suporte Web:
    ```bash
    flutter config --android-sdk ~/Android/Sdk
    flutter config --enable-web
    ```
4.  **Instale o Google Chrome no WSL** para testes web:
    ```bash
    sudo apt-get update
    sudo apt-get install -y curl gpg
    curl -fSsl [https://dl.google.com/linux/linux_signing_key.pub](https://dl.google.com/linux/linux_signing_key.pub) | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] [http://dl.google.com/linux/chrome/deb/](http://dl.google.com/linux/chrome/deb/) stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
    sudo apt-get install -y google-chrome-stable
    ```
5.  **Reinicie o VS Code** completamente após todos os passos.

</details>

---

## ▶️ Executando o Projeto

1.  **Abra o projeto no VS Code:**
    ```bash
    cd ~/development/busuff_transporte # (ou o nome da sua pasta)
    code .
    ```
2.  **Verifique os dispositivos disponíveis** com o comando `flutter devices` no terminal do VS Code.
3.  **Escolha o seu alvo:**
    * No canto inferior direito do VS Code, clique no nome do dispositivo.
    * Selecione seu **celular Android** (requer depuração USB ativada) ou **Chrome (web)**.
4.  **Inicie o aplicativo:**
    * Pressione a tecla **`F5`** ou vá no menu `Executar > Iniciar Depuração`.

O aplicativo será compilado e executado no dispositivo escolhido.

---

Trabalho: Kassiano e Jessica 