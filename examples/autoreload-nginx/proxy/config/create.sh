#!/usr/bin/env bash

LOCATION_ROOT="" 
export NGINX_ROOT=""
export NGINX_HOME="$HOME/nginx"
export NGINX_CONFIGS="$NGINX_HOME/config"
export NGINX_LOGS="$NGINX_HOME/logs"
export NGINX_LOCATIONS="$NGINX_HOME/locations"
export NGINX_LOCATIONS_ROOT="$NGINX_LOCATIONS/root"
export NGINX_LOCATIONS_API_PROXY=""
export NGINX_SERVER_ROOT_HOST=""
export NGINX_SERVER_ROOT_PORT=""
export NGINX_SSL_CERTIFICATE=""
export NGINX_SSL_CERTIFICATE_KEY=""

declare -a _nginx_folders=(
  $NGINX_HOME
  $NGINX_CONFIGS  
  $NGINX_LOCATIONS
  $NGINX_LOGS
)
for i in "${_nginx_folders[@]}"
  do
    [[ ! -d "$i" ]] && mkdir -m 755 -p "$i";
done

rm -f $NGINX_LOCATIONS_ROOT
ln -s $LOCATION_ROOT $NGINX_LOCATIONS_ROOT
# inject env vars and only those available
envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < "$NGINX_CONFIGS/nginx.conf.template" > "$NGINX_CONFIGS/nginx.conf"

function runNginx () {
  PARAMS="";
  # reload nginx if nginx pid is there and no parameters are passed
  if [[ -f $NGINX_LOGS/nginx.pid && -d /proc/$(cat $NGINX_LOGS/nginx.pid) && $# -eq 0 ]]; then
    PARAMS="-s reload"
  else
    PARAMS="$@"
  fi

  $NGINX_ROOT/sbin/nginx \
    -c $NGINX_CONFIGS/nginx.conf \
    -p $NGINX_HOME \
  $PARAMS
}
