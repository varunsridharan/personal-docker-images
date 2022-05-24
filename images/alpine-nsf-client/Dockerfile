FROM alpine:latest

# Install Required Libs
RUN apk --no-cache --update upgrade
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
COPY images/alpine-nsf-client/scripts/nfs-mount.sh /scripts/nfs-mount.sh

CMD ["bash /scripts/nfs-mount.sh"]
ENTRYPOINT ["/init"]
