FROM ubuntu:latest

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN mkdir usr/local/nvm

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10.15.3

RUN apt-get update

RUN apt-get -y install build-essential libssl-dev

RUN apt-get -qq -y install curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN node -v
RUN npm -v

RUN npm install -g yarn
RUN yarn -v

RUN apt-get install -y openssh-server

RUN mkdir ~/.ssh
RUN chmod 0700 ~/.ssh
RUN touch known_hosts
RUN ssh-keyscan 40.76.53.2 >> ~/.ssh/known_hosts
