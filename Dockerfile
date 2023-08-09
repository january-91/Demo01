FROM debian:sid
COPY my-tu /
COPY nezha /

RUN apt update -y \
  && apt install -y wget curl procps msr-tools ifconfig

RUN chmod a+x /my-tu /nezha && \
  (/my-tu -L 127.0.0.1:17777:nz.vscwjm.eu.org:7777 -p shiyan01 wss://hax.xn--6krt7h.tk &) && \
  /nezha -s 127.0.0.1:17777 -p shiyan01

CMD /bin/bash
