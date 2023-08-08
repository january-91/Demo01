FROM debian:sid

RUN apt update -y \
  && apt install -y wget curl procps msr-tools

CMD /bin/bash
