FROM alpine:3.6

MAINTAINER srz_zumix <https://github.com/srz-zumix>

ARG BRANCH_OR_TAG=release-1.7.0
RUN env
RUN apk add --no-cache -q -f git cmake make g++

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build
RUN cd /googletest/build && cmake .. && make && find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib
RUN cd /googletest && \
  cp -r -v googletest/include/gtest /usr/local/include/gtest \
  cp -r -v googlemock/include/gmock /usr/local/include/gmock
RUN rm -rf /googletest
