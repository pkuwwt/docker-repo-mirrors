FROM python:3.7

RUN pip install pip2pi

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY pip.config /root/.pip/pip.config

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD []

EXPOSE 80
