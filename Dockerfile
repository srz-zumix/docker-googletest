FROM alpine:2.6

MAINTAINER srz_zumix <https://github.com/srz-zumix>

ARG BRANCH_OR_TAG=release-1.4.0
RUN env
RUN apk update && apk upgrade && \
  apk search g++ && \
  apk add -q -f git cmake make g++ && \
  apk add -q -f --virtual .builddeps automake autoconf libtool python

RUN curl http://curl.haxx.se/ca/cacert.pem -o /usr/ssl/certs/ca-bundle.crt
RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
RUN mkdir -p /gtest/build
RUN cd /gtest && autoreconf -fvi && ./configure && make && make install

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock
RUN mv /gtest /googlemock/gtest
RUN cd /googlemock && autoreconf -fvi && ./configure && make && make install

RUN rm -rf /googlemock
RUN apk del .builddeps
