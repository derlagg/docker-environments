FROM nvm-dev

RUN apt-get update

RUN nvm install lts

RUN apt-get install -y openssh-server

RUN ssh-keyscan 40.76.53.2 >> ~/.ssh/known_hosts
