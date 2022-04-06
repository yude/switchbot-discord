FROM alpine/curl

WORKDIR /app
ADD run.sh /app/
ADD crontab /var/spool/cron/crontabs/root
RUN chmod 644 /app/run.sh

CMD crond -l -1 -f