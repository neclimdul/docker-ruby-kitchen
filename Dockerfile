FROM ruby:2.2-alpine
MAINTAINER James Gilliland <jgilliland@apqc.org>

RUN apk update && \
    apk upgrade && \
    apk -U add build-base \
      git \
      libxml2-dev \
      libxslt-dev && \
    rm -rf /tmp && \
    rm -rf /var/cache/apk/* && \
    truncate -s 0 /var/log/*log
