FROM python:3.7

RUN pip install pip2pi

COPY cmd.sh /usr/bin/cmd.sh
COPY pip.config /root/.pip/pip.config

ENTRYPOINT ["/usr/bin/cmd.sh"]

CMD []

EXPOSE 80
