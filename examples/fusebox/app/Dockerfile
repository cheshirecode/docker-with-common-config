FROM node:8.6.0-alpine

WORKDIR /usr/node/app
RUN chown -R node:node .
USER node
COPY --chown=node:node ./app/package.json .
RUN yarn && \
  ls -asl .
COPY --chown=node:node ./app/ .

EXPOSE 4444

USER root
CMD node fuse.js
# CMD tail -f /dev/null