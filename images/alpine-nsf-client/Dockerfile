FROM alpine:latest

# Install Required Libs
RUN apk add --no-cache bash
RUN apk add --no-cache tzdata 
RUN apk add --no-cache nfs-utils rpcbind
RUN apk add --update coreutils && rm -rf /var/cache/apk/*

## Setup Timezone
RUN cp /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
RUN echo "Asia/Kolkata" >  /etc/timezone

# Remove Unwanted Libs
RUN apk del tzdata
