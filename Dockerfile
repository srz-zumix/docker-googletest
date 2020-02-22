FROM ubuntu:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=release-1.5.0
RUN env \
  && apt-get update \
  && apt-get install -q -y git cmake make g++ lcov \
  && apt-get install -y -q automake autoconf libtool python \
  && apt-get clean

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
RUN mkdir -p /gtest/build
WORKDIR /gtest/build
RUN cmake -DBUILD_SHARED_LIBS=ON .. \
  && make \
  && find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib \
  ; cp -rv /gtest/include/gtest/. /usr/local/include/gtest/

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock \
  && mv /gtest /googlemock/gtest
WORKDIR /googlemock
RUN autoreconf -fvi \
  && ./configure \
  && make \
  && make install \
  && bash -c 'echo /usr/local/lib >> /etc/ld.so.conf.d/usr_local_path.conf' \
  && ldconfig
RUN mkdir -p /code
WORKDIR /code
RUN rm -rf /googlemock
