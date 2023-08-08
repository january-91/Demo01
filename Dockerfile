FROM debian:sid


RUN apt update -y \
  && apt upgrade -y \
  && apt install -y wget curl procps msr-tools ifconfig

CMD /bin/bash
