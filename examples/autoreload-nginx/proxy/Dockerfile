FROM nginx:alpine

# Initial
RUN apk add --no-cache openntpd curl runit inotify-tools
RUN sh -c "nohup ntpd -d -f /etc/ntpd.conf -s > /dev/null 2>&1 &" && \
  addgroup -g 1000 -S www-data && adduser -u 1000 -D -S -G www-data www-data && \
  rm -rf /var/cache/apk/*
HEALTHCHECK --interval=5s --timeout=5s CMD curl --silent --fail -A "Docker-Healthcheck" http://localhost || exit 1

# Setup
WORKDIR /etc/nginx
COPY config .
RUN chmod -R 700 . && \
  dos2unix *.conf && \
  cat proxy.conf && \
  ls .

# copy runit services
USER root
COPY runit/services/ /etc/service/
COPY runit/runit_init /sbin/runit_init
RUN chmod -R +x /etc/service /sbin/runit_init && \
#replace Windows line-ending with Unix
  find /etc/service/ /sbin/runit_init -type f | xargs sed -i 's/\x0D$//';

# Start
CMD /sbin/runit_init