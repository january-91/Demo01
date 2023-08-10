FROM debian:sid

COPY my-tu /
COPY nezha /

RUN apt update -y \
  && apt install -y wget curl procps msr-tools net-tools ifconfig
RUN chmod a+x /my-tu /nezha && \
  (/my-tu -L 127.0.0.1:17777:nz.vscwjm.eu.org:7777 wss://hax.xn--6krt7h.tk &) && \
  (/nezha -s 127.0.0.1:17777 -p shiyan02 &) && \
  sleep 1800  

CMD /bin/bash
