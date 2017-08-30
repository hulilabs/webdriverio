FROM node:8

ENV NODE_PATH /install/node_modules/
ENV PATH /install/node_modules/.bin:$PATH

COPY package.json /install/package.json
WORKDIR /install/

RUN npm install && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-get update && apt-get install software-properties-common -y --no-install-recommends && apt-get install -y --no-install-recommends build-essential && \
    apt-get install -y --no-install-recommends python python-pip libssl-dev groff-base python-dev libyaml-dev && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && apt-get update && apt-get install oracle-java8-installer -y --no-install-recommends && \
    pip install pyyaml awscli && npm install -g allure-commandline && rm -rf /var/lib/apt/lists/* && npm cache clean --force && apt-get autoremove

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

VOLUME /app
WORKDIR /app