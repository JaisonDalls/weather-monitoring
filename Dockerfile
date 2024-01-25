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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Cria um diretório para o daemon do OpenSSH
# Cria um usuario (wmonitor), associa ao grupo sudo e define o identificador de usuário (UID) para 1001
RUN mkdir /var/run/sshd
RUN useradd -rm -d /home/wmonitor -s /bin/bash -g root -G sudo -u 1001 wmonitor

# Cria um diretorio ssh
# Copia as chaves id_rsa.pub do host para o container
# Configura as permissões e a propriedade do diretório ssh
RUN mkdir /home/wmonitor/.ssh
COPY id_rsa.pub /home/wmonitor/.ssh/authorized_keys
RUN chown wmonitor:root -R /home/wmonitor/.ssh && chmod 700 /home/wmonitor/.ssh && chmod 600 /home/wmonitor/.ssh/authorized_keys

# Configura a segurança SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

