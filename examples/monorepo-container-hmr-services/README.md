# Sample monorepo without using Lerna

Combine `monorepo-container` with `applications-as-runit-services` to have separate build-on-change
appplication and library which was consumed by application.

# How to run

* At the root folder, `docker-compose up --build -d`
* Go to `./packages/node_modules/monorepo-app/src`, edit a file.
* Go to `./packages/node_modules/monorepo-lib/src`, edit a file.

# How to debug

* Use `CMD tail -f /dev/null` (comment out the other `CMD`) in Dockerfile and re-run.
* Use `docker exec -it monorepo-container /bin/sh` to attach to the container's shell and debug from
  there.
