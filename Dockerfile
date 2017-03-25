

FROM openjdk:8

MAINTAINER MobileMind

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN \
	dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get upgrade -y && \ 
	apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 g++ ant python make curl

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
	apt-get install -y nodejs

RUN npm install nativescript@2.5.0 -g --allow-root --unsafe-perm && tns doctor

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION v7.5.0
ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION
ENV ANDROID_HOME /android-sdk
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

RUN mkdir /app

WORKDIR /app
