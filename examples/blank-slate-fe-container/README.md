# Barebone container to set up 1st FE environment

* Requires `docker` and `docker-compose`.
* Refer to `run.sh` for Linux/Mac or `run.ps1` for Windows for commands to start/tear down.
* You should know see the CLI prompt inside the container

```
/usr/node/app
```

* Do your thing, like `yarn add <package>` and see the updates reflected in host folder.
* Out of the box, the Dockerfile has this `CMD` instruction:

```
CMD tail -f /dev/null
```

to force the container to run forever. Eventually during development you would replace it with `node
...`, `yarn start` or another startup script.
