FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y build-essential sudo curl git-core gnupg locales nodejs zsh wget nano nodejs npm fonts-powerline && \
    locale-gen en_US.UTF-8

# adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser && \
#     echo "devuser:<a href="mailto://sheesh">sheesh</a>" | chpasswd &&  usermod -aG sudo devuser

RUN localedef -i en_US -f UTF-8 en_US.UTF-8

RUN useradd -m -s /bin/bash linuxbrew && \
    echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

USER root
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"