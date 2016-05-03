FROM ruby:2.1-alpine
MAINTAINER James Gilliland <jgilliland@apqc.org>

RUN apt-get update && \
  apt-get install -y -q git

# cleanup after ourselves
RUN rm *.deb && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
  truncate -s 0 /var/log/*log
