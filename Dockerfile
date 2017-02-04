FROM node:latest

MAINTAINER Florian Wittmann <dev@florianwittmann.de>

RUN npm set progress=false
RUN npm install -g --progress=false yarn 
RUN yarn global add firebase-tools
RUN yarn global add netlify-cli

RUN apt-get update
RUN apt-get -y install xvfb
RUN apt-get install -y libappindicator1 fonts-liberation libpango1.0-0 libxss1 xdg-utils
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
    
ADD xvfb-chromium /usr/bin/xvfb-chromium

RUN mv /usr/bin/google-chrome /usr/bin/google-chrome-unwrapped
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser 
RUN chmod +777 /usr/bin/google-chrome
RUN chmod +777 /usr/bin/xvfb-chromium
RUN chmod +777 /usr/bin/chromium-browser
RUN chmod +777 /usr/bin/google-chrome-unwrapped

WORKDIR /workspace
