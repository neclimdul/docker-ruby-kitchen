FROM cloudgear/ruby:2.2
MAINTAINER James Gilliland <jgilliland@apqc.org>
RUN apt-get update && apt-get install -y git && \
  apt-get install -y ssh-client && \
  apt-get install -y --no-install-recommends libgecode-dev && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
