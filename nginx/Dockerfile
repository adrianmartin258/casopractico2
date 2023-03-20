FROM nginx:1.11.9-alpine


RUN apk add --no-cache --update \
      apache2-utils
RUN rm -f /etc/nginx/conf.d/*

ENV SERVER_NAME example.com
ENV PORT 80
ENV CLIENT_MAX_BODY_SIZE 1m
ENV PROXY_READ_TIMEOUT 60s
ENV WORKER_PROCESSES auto

COPY files/certificado.crt /etc/ssl/certificado.crt
COPY files/clave.key /etc/ssl/clave.key

COPY files/run.sh /
COPY files/nginx.conf.tmpl /

RUN chmod +x /run.sh
STOPSIGNAL SIGQUIT

ENTRYPOINT ["/run.sh"]
