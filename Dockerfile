FROM alpine/curl

RUN apk update; apk upgrade; apk add --no-cache jq

WORKDIR /app
ADD run.sh /app/
ADD crontab /var/spool/cron/crontabs/root
RUN chmod 644 /app/run.sh

CMD crond -l 1 -f