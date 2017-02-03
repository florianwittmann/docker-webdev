FROM node:latest

MAINTAINER Florian Wittmann <dev@florianwittmann.de>

RUN npm set progress=false && \
    npm install -g --progress=false yarn  && \
    yarn global add firebase-tools  && \
    yarn global add netlify-cli && \
    apt-get -y install default-jre
    
WORKDIR /workspace
