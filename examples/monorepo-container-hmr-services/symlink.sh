#!/bin/sh
cd /usr/node/app;
PACKAGE_PATH='packages/node_modules';
cd $PACKAGE_PATH;
for currentDir in */ ;
   do
    ln -sf ../${PACKAGE_PATH}/${currentDir} ../../node_modules/${currentDir%?}
done