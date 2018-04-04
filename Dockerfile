FROM ubuntu:trusty

MAINTAINER srz_zumix <https://github.com/srz-zumix>

ARG BRANCH_OR_TAG=release-1.4.0
RUN env
RUN apt-get update && \
  apt-get install -y -q git cmake make g++-4.6 && \
  apt-get install -y -q automake autoconf libtool python
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 20 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 20 

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
RUN mkdir -p /gtest/build
RUN cd /gtest && autoreconf -fvi && ./configure && make && make install

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock
RUN mv /gtest /googlemock/gtest
RUN cd /googlemock && autoreconf -fvi && ./configure && make && make install

RUN rm -rf /googlemock
#RUN apt-get purge automake autoconf libtool python
RUN apt-get clean
