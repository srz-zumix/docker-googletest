FROM ubuntu:precise

MAINTAINER srz_zumix <https://github.com/srz-zumix>

ARG BRANCH_OR_TAG=release-1.4.0
RUN env
#RUN apt-get update -qq && \
#    apt-get install -y -qq software-properties-common && \
#    add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update -qq && \
    apt-get install -y -qq git cmake make build-essential && \
    apt-get install -y -qq automake autoconf libtool python

RUN git --version
RUN git clone -q https://github.com/google/googletest.git /gtest
RUN cd /gtest && git checkout -b $BRANCH_OR_TAG -q refs/tags/$BRANCH_OR_TAG
RUN mkdir -p /gtest/build
RUN cd /gtest && autoreconf -fvi && ./configure && make && make install

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock
RUN mv /gtest /googlemock/gtest
RUN cd /googlemock && autoreconf -fvi && ./configure && make && make install

RUN rm -rf /googlemock
#RUN apt-get purge automake autoconf libtool python
RUN apt-get clean
