FROM alpine:latest

RUN apk add bash

COPY images/alpine-sefhosted-backup/scripts/ /scripts/

RUN chmod -R 755  /scripts/

RUN /usr/bin/crontab /scripts/crontab.txt

CMD ["/entry.sh"]