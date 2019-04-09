FROM alpine:latest

RUN apk update && apk add dcron wget rsync ca-certificates sshpass openssh-client bash bash-doc bash-completion tar mysql-client && rm -rf /var/cache/apk/*

RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d

COPY /scripts/* /

COPY /backup.sh /backup.sh

ENTRYPOINT ["/docker-entry.sh"]
CMD ["/docker-cmd.sh"]
