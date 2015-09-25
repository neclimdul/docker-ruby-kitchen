FROM cloudgear/ruby:2.2
MAINTAINER James Gilliland <jgilliland@apqc.org>
RUN apt-get update && apt-get install -y git
RUN apt-get install libgecode36

