#!/bin/sh
./symlink.sh;
ls -asl .;
cd packages/node_modules/;
find . -type d -name "mono*" -maxdepth 1 | xargs -n 1 -I '$' sh -c 'ls -asl $'
cd -;