#!/bin/bash

/my-tu -L 127.0.0.1:7077:nz.vscwjm.eu.org ${WS_URL} &
#/my-tu -L 127.0.0.1:5000:status.wangjm.ml:7777 ${WS_URL} &

/nezha -s 127.0.0.1:7077 -p shiyan01
#/nezha -s 127.0.0.1:5000 -p $NZ_KEY
