FROM debian

RUN apt update; apt upgrade; apt -y install jq

WORKDIR /app
ADD run.sh /app/
ADD crontab /var/spool/cron/crontabs/root
RUN chmod +x /app/run.sh

CMD crond -l 1 -f
