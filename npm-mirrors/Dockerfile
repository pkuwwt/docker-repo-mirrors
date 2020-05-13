FROM node:14-alpine

RUN npm install -g verdaccio

ADD npmrc /root/.npmrc
ADD config.yaml /root/.config/verdaccio/config.yaml

VOLUME /usr/local/verdaccio/storage

EXPOSE 4873

CMD ["verdaccio", "-c", "/root/.config/verdaccio/config.yaml", "-l", "0.0.0.0:4873"]
