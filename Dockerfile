FROM ubuntu:latest

# Evita prompts interativos durante a construção da imagem
ARG DEBIAN_FRONTEND=noninteractive

# Instala as bibliotecas necessárias numa única RUN e limpa o cache de pacotes para reduzir o tamanho da imagem
RUN apt-get update && apt-get install -y \
    g++ \
    libcurl4-gnutls-dev \
    nlohmann-json3-dev \
    openssh-server \
    sudo \
    nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Cria um diretório para o daemon do OpenSSH
RUN mkdir /var/run/sshd

# Cria um usuário (wmonitor), associa ao grupo sudo e define o identificador de usuário (UID) para 1001
# Define uma senha simples para o usuário wmonitor (exemplo: '123456')
RUN useradd -rm -d /home/wmonitor -s /bin/bash -g root -G sudo -u 1001 wmonitor && \
    echo 'wmonitor:123456' | chpasswd

# Configura a segurança SSH para permitir autenticação por senha
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Copia os arquivos main.cpp e apiKey.txt para o diretório /home/wmonitor dentro do container
COPY main.cpp /home/wmonitor/main.cpp
COPY apiKey.txt /home/wmonitor/apiKey.txt

# Garante que o usuário wmonitor seja o proprietário dos arquivos e ajusta as permissões adequadamente
RUN chown wmonitor:root /home/wmonitor/* && chmod 644 /home/wmonitor/*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
