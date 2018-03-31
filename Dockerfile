FROM ubuntu:xenial

MAINTAINER srz_zumix <https://github.com/srz-zumix>

ARG BRANCH_OR_TAG=release-1.7.0
RUN env
RUN apt-get update && \
  apt-get install -q -y git cmake make g++

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
RUN mkdir -p /gtest/build
RUN cd /gtest/build && cmake .. && make && find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib
RUN cp -rv /gtest/include/gtest/. /usr/local/include/gtest/

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock
RUN mkdir -p /googlemock/build
RUN cd /googlemock/build && cmake .. && make && find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib
RUN cp -rv /googlemock/include/gmock/. /usr/local/include/gmock/

RUN rm -rf /gtest
RUN rm -rf /googlemock
RUN apt-get clean
