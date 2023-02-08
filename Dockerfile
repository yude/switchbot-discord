FROM debian

RUN apt update; apt upgrade; apt -y install jq curl cron

WORKDIR /app
ADD run.sh /app/
ADD crontab /var/spool/cron/crontabs/root
RUN chmod +x /app/run.sh

CMD cron -l 1 -f
