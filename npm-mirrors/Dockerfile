FROM andreysenov/node-gyp
ADD npmrc /root/.npmrc
ADD npmrc /home/node/.npmrc

USER root
RUN npm install -g verdaccio --unsafe-perm

RUN mkdir -p /usr/local/verdaccio/storage
COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY config.yaml /usr/local/verdaccio/config.yaml
COPY config_offline.yaml /usr/local/verdaccio/config_offline.yaml

RUN chmod +x /usr/bin/entrypoint.sh

WORKDIR /tmp/cache
VOLUME /usr/local/verdaccio/storage

EXPOSE 4873

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD []
