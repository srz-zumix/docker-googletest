FROM ubuntu:xenial

MAINTAINER srz_zumix <https://github.com/srz-zumix>

ARG BRANCH_OR_TAG=release-1.5.0
RUN env
RUN apt-get update && \
  apt-get install -y -q git cmake make g++ && \
  apt-get install -y -q automake autoconf libtool python

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
RUN mkdir -p /gtest/build
RUN cd /gtest/build && cmake .. && make && find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib
RUN cp -rv /gtest/include/gtest/. /usr/local/include/gtest/

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock
RUN mv /gtest /googlemock/gtest
RUN cd /googlemock && autoreconf -fvi && ./configure && make && make install

RUN rm -rf /googlemock
RUN apt-get clean
