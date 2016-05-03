FROM ruby:2.1-alpine
MAINTAINER James Gilliland <jgilliland@apqc.org>

RUN apk update && \
    apk upgrade && \
    apk -U add git

# cleanup after ourselves
RUN rm -rf /tmp && \
  rm -rf /var/cache/apk/* && \
  truncate -s 0 /var/log/*log
