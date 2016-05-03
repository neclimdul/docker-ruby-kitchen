FROM ruby:2.1-alpine
MAINTAINER James Gilliland <jgilliland@apqc.org>

RUN apk update && \
    apk upgrade && \
    apk -U add git

# cleanup after ourselves
RUN rm *.deb && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
  truncate -s 0 /var/log/*log
