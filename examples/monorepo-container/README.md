# Sample monorepo without using Lerna

1. From blank-slate-fe-container
2. Lerna doesn't work with Fusebox in container mode (https://github.com/rollup/rollup/issues/1919)
3. Implemented ideas based on https://gist.github.com/nolanlawson/457cdb309c9ec5b39f0d420266a9faa4
4. Module bundler doesn't like refrences outside the folder where it is called from and forced a
   symlink approach with [this script](symlink.sh)

# How to run

* At the root folder, `docker-compose up --build -d`

# How to debug

* Use `CMD tail -f /dev/null` (comment out the other `CMD`) in Dockerfile and re-run.
* Use `docker exec -it monorepo-container /bin/sh` to attach to the container's shell and debug from
  there.
