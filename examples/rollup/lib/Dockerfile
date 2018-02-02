FROM node:8.6.0-alpine

WORKDIR /usr/node/app
RUN chown -R node:node .
USER node

RUN ls -asl .

EXPOSE 3101

CMD tail -f /dev/null