FROM alpine

RUN apk update; apk upgrade; apk add --no-cache jq curl tzdata

WORKDIR /app
ADD run.sh /app/
ADD crontab /var/spool/cron/crontabs/root
RUN chmod +x /app/run.sh

CMD crond -l 1 -f
