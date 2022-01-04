FROM alpine:latest

# Install Required Libs
RUN apk add bash
RUN apk add tzdata
RUN apk add --update coreutils && rm -rf /var/cache/apk/*

## Setup Timezone
RUN cp /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
RUN echo "Asia/Kolkata" >  /etc/timezone

# Remove Unwanted Libs
RUN apk del tzdata

# Setup Instance
COPY images/alpine-call-recording-organizer/scripts/ /scripts/
RUN chmod -R 755  /scripts/
RUN /usr/bin/crontab /scripts/cron.txt

CMD ["/scripts/entry.sh"]