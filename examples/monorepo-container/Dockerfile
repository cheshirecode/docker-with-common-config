FROM node:8.6.0-alpine

WORKDIR /usr/node/app
RUN chown -R node:node .
USER node
COPY --chown=node:node ./package.json ./yarn.lock ./
RUN yarn
COPY --chown=node:node . .

RUN  find *.sh -type f | xargs sed -i 's/\x0D$//' && \
  chmod +x *.sh && \
  ./init.sh

EXPOSE 4444

USER root
CMD yarn start
# CMD tail -f /dev/null