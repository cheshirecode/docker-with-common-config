# Frontend development container with persistent yarn cache

Based on https://github.com/yarnpkg/yarn/issues/749#issuecomment-253413954 and
https://hackernoon.com/using-yarn-with-docker-c116ad289d56.

## Notes

* Supply your own dotenv file with `YARN_CACHE` value like `YARN_CACHE_DIR=<Cache folder>`.
* Assume location of yarn cache folder in container

```
/usr/node/app # yarn -v
1.3.2
/usr/node/app # yarn cache dir
/usr/local/share/.cache/yarn/v1
```

* Mount Yarn global cache folder in host as a volume mapped to yarn global cache folder.
* Subsequent runs/builds should use that cache.
* Docker layers would not include yarn installation in order to re-use cache volume as speed is more
  important here. This is **not for production**.
* Ideally, .cache folder should be made global but out of scope for this example.

## Results

### Without cache

**~210s** installation time (YMMV with different packages, of course!).

```
/usr/node/app # yarn clean; yarn cache clean; time sh -c "yarn &> /dev/null"
yarn run v1.3.2
$ rm -rf node_modules/* node_modules/.[!.]*
Done in 0.37s.
yarn cache v1.3.2
⠠
⢀
success Cleared cache.
Done in 70.47s.

real    3m 22.91s
user    0m 25.01s
sys     0m 21.38s
```

### With cache

**~210s** -> **~35s** so around 6x improvement (again, YMMV).

```
/usr/node/app # yarn clean; time sh -c "yarn &> /dev/null"
yarn run v1.3.2
$ rm -rf node_modules/* node_modules/.[!.]*
Done in 0.36s.
real    0m 33.19s
user    0m 6.61s
sys     0m 6.54s
```
