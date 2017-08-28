FROM node:8

RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN apt-get update
RUN apt install -t jessie-backports openjdk-8-jre-headless ca-certificates-java openjdk-8-jdk -y --no-install-recommends

ENV NODE_PATH /install/node_modules/
ENV PATH /install/node_modules/.bin:$PATH

COPY package.json /install/package.json
WORKDIR /install/
RUN npm install

VOLUME /app
WORKDIR /app
