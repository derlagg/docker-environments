FROM node:lts-alpine

RUN node -v
RUN npm -v
RUN yarn -v

RUN apk update

RUN apk add openssh

RUN ls ~

RUN mkdir ~/.ssh
RUN chmod 0700 ~/.ssh
RUN touch known_hosts
RUN ssh-keyscan 40.76.53.2 >> ~/.ssh/known_hosts

CMD ["node"]
