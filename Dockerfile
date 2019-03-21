FROM ubuntu:latest

RUN apt-get -qq -y install curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
RUN nvm install lts

RUN apt-get update

RUN apt-get install -y openssh-server

RUN ssh-keyscan 40.76.53.2 >> ~/.ssh/known_hosts
