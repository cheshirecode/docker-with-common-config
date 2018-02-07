FROM node:8.9.3-alpine

# base
ARG APP
ENV APP $APP
ARG APP_PORT
ENV APP_PORT $APP_PORT
RUN apk add --no-cache runit inotify-tools && \
  mkdir -p /usr/node/$APP && \
  chown -R node:node /usr/node/

# core setup
WORKDIR /usr/node/$APP
USER node
COPY --chown=node:node ./package.json ./yarn.lock ./
RUN yarn
COPY --chown=node:node . .

RUN  find *.sh -type f | xargs sed -i 's/\x0D$//' && \
  chmod +x *.sh && \
  ./init.sh

# copy runit services
USER root
COPY runit/ /etc/service/
COPY runit/runit_init /sbin/runit_init
RUN mv /etc/service/__app__ /etc/service/$APP && \
  chmod -R +x /etc/service /sbin/runit_init && \
#replace Windows line-ending with Unix
  find /etc/service/ /sbin/runit_init -type f | xargs sed -i 's/\x0D$//';

EXPOSE $APP_PORT
CMD /sbin/runit_init