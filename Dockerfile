FROM node:14-alpine

WORKDIR /usr/src/app

COPY --chown=node:node . /usr/src/app
RUN npm install

USER node

CMD ["npm", "start"]