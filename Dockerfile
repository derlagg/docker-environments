FROM node:lts-alpine

RUN apt-get update

RUN apt-get install -y openssh-server

RUN ssh-keyscan 40.76.53.2 >> ~/.ssh/known_hosts