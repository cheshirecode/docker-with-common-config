FROM node:8.9.3-alpine

WORKDIR /usr/node/app
RUN apk add --no-cache curl && \
 chown -R node:node .
USER node
COPY ./package.json ./yarn.lock ./
RUN yarn
COPY . .
RUN ls -asl .

# CMD tail -f /dev/null
CMD yarn start