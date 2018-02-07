FROM node:8.9.3-alpine

# base
ARG APP
ENV APP $APP
ARG APP_PORT
RUN apk add --no-cache runit && \
  mkdir -p /usr/node/ && \
  chown -R node:node /usr/node/

# core setup
WORKDIR /usr/node
USER node
COPY --chown=node:node $APP ./$APP
COPY --chown=node:node core ./core

# copy runit services
USER root
COPY docker/services /etc/service/
COPY docker/runit_init /sbin/runit_init
RUN mv /etc/service/__app__ /etc/service/$APP && \
  chmod -R +x /etc/service /sbin/runit_init && \
#replace Windows line-ending with Unix
  find /etc/service/ /sbin/runit_init -type f | xargs sed -i 's/\x0D$//';

EXPOSE $APP_PORT
CMD /sbin/runit_init