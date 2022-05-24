FROM alpine:latest

# Install Required Libs
RUN apk add --no-cache bash
RUN apk add --no-cache tzdata 
RUN apk add --no-cache nfs-utils
RUN apk add --no-cache --update coreutils 
RUN apk add --no-cache rpcbind
RUN rm -rf /var/cache/apk/*

## Setup Timezone
RUN cp /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
RUN echo "Asia/Kolkata" >  /etc/timezone

# Remove Unwanted Libs
RUN apk del tzdata

# Setup Instance
COPY images/alpine-nsf-client/scripts/ /scripts/
RUN chmod -R 755  /scripts/
CMD ["bash /scripts/nfs-mount.sh"]
