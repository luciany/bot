FROM node:carbon

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

COPY package*.json ./

ENV PATH /app/node_modules/.bin:$PATH

ADD package.json /usr/src/app

RUN npm install

# App
ADD . /usr/src/app

# Install app dependencies
RUN cd /usr/src/app; npm install

EXPOSE  8080
CMD ["node", "/usr/src/app/index.js"]
