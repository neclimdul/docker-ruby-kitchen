FROM cloudgear/ruby:2.2

MAINTAINER James Gilliland <jgilliland@apqc.org>

RUN apt-get update && \
  apt-get install -y -q git wget ssh-client

# HACK - get old gecode libraries for dep-selector-libgecode.
RUN apt-get install -y -q libqtcore4 libqtgui4 libqt4-dev libboost-dev
RUN wget -nv "http://us.archive.ubuntu.com/ubuntu/pool/universe/g/gecode/libgecode30_3.7.1-3_amd64.deb"
RUN wget -nv "http://us.archive.ubuntu.com/ubuntu/pool/universe/g/gecode/libgecode-dev_3.7.1-3_amd64.deb"
RUN wget -nv "http://us.archive.ubuntu.com/ubuntu/pool/universe/g/gecode/libgecodegist30_3.7.1-3_amd64.deb"
RUN wget -nv "http://us.archive.ubuntu.com/ubuntu/pool/universe/g/gecode/libgecodeflatzinc30_3.7.1-3_amd64.deb"
RUN dpkg -i libgecode30_3.7.1-3_amd64.deb libgecodegist30_3.7.1-3_amd64.deb libgecodeflatzinc30_3.7.1-3_amd64.deb libgecode-dev_3.7.1-3_amd64.deb

# cleanup after ourselves
RUN rm *.deb && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
  truncate -s 0 /var/log/*log

# Install berkshelf
# We know we're going to use it and it gets a lot of the native deps out of the way.
RUN USE_SYSTEM_GECODE=1 gem install berkshelf && \
  gem install foodcritic rubocop test-kitchen chefspec
