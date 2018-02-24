FROM cheshirecode/alpine-runit:node_8.9.3

WORKDIR /usr/node/app
RUN chown -R node:node .
COPY --chown=node:node app/ .
EXPOSE 3101

CMD tail -f /dev/null