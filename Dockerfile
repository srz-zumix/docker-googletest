FROM ubuntu:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=release-1.4.0
RUN env \
  && apt-get update \
  && apt-get install -y -q git cmake make g++ lcov \
  && apt-get install -y -q automake autoconf libtool python-is-python3 \
  && apt-get clean

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
COPY patch /tmp/patch
RUN git -C /gtest apply /tmp/patch/$BRANCH_OR_TAG.patch
WORKDIR /gtest
RUN autoreconf -fvi \
  && ./configure \
  && make \
  && make install

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock \
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
RUN rm -rf /googlemock /tmp/patch
