FROM node:latest

MAINTAINER Florian Wittmann <dev@florianwittmann.de>

RUN npm set progress=false && \
    npm install -g --progress=false yarn  && \
    yarn global add firebase-tools  && \
    yarn global add netlify-cli && \
    yarn global add phantomjs-prebuilt && \
    apt-get update && \
    apt-get -y install default-jre xvfb chromium
    
ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser    
    
    
WORKDIR /workspace
