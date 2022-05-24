FROM alpine:latest

# Install Required Libs
#RUN apk --no-cache --update upgrade
RUN apk add --no-cache bash
RUN apk add --no-cache tzdata 
RUN apk add --no-cache nfs-utils
RUN apk add --no-cache coreutils 
RUN apk add --no-cache rpcbind
RUN rm -rf /var/cache/apk/*

## Setup Timezone
RUN cp /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
RUN echo "Asia/Kolkata" >  /etc/timezone

# Remove Unwanted Libs
RUN apk del tzdata

# Setup Instance
#ADD  images/alpine-nsf-client/scripts/nfs-mount.sh /scripts/nfs-mount.sh
COPY images/alpine-nsf-client/scripts/ /scripts/
RUN chmod -R 755  /scripts/
#RUN /bin/bash /scripts/nfs-mount.sh

RUN chmod +x /scripts/nfs-mount.sh
RUN chmod +x /scripts/entry.sh

ENTRYPOINT ["/bin/sh"]
CMD ["/scripts/entry.sh"]

#CMD ["/bin/bash /scripts/nfs-mount.sh"]
#ENTRYPOINT ["/bin/sh","/bin/bash","/scripts/nfs-mount.sh"]
