FROM alpine:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=release-1.7.0
RUN env && \
  apk update && apk upgrade && \
  apk add --no-cache -q -f git cmake make g++ && \

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
RUN mkdir -p /gtest/build
WORKDIR /gtest/build
RUN cmake .. && make && \
  find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib && \
  [ ! -e /usr/local/include ] && mkdir -p /usr/local/include ; \
  cp -rv /gtest/include/gtest/. /usr/local/include/gtest/

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock
RUN mkdir -p /googlemock/build
WORKDIR /googlemock/build
RUN cmake .. && make && \
  find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib && \
  cp -rv /googlemock/include/gmock/. /usr/local/include/gmock/

RUN rm -rf /gtest && rm -rf /googlemock
