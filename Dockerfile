FROM node:14-alpine

USER node
WORKDIR /usr/src/app

COPY --chown=node:node . /usr/src/app
RUN npm install

CMD ["npm", "start"]