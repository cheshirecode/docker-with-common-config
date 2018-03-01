FROM cheshirecode/alpine-runit:node_8.9.3

WORKDIR /usr/node/app
RUN chown -R node:node .
COPY --chown=node:node app/package.json app/yarn.lock ./
RUN yarn install --pure-lockfile
COPY --chown=node:node app/ .
EXPOSE 3100

CMD yarn start