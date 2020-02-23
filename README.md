# docker-googletest


[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e44a06fa5dfa4b35bc457714a4e1161a)](https://app.codacy.com/app/srz-zumix/docker-googletest?utm_source=github.com&utm_medium=referral&utm_content=srz-zumix/docker-googletest&utm_campaign=Badge_Grade_Dashboard)
[![Docker Build Status](https://img.shields.io/docker/build/srzzumix/googletest.svg)](https://hub.docker.com/r/srzzumix/googletest/)
[![Build Status](https://travis-ci.org/srz-zumix/docker-googletest.svg?branch=master)](https://travis-ci.org/srz-zumix/docker-googletest)
[![GitHub Actions Status](https://github.com/srz-zumix/docker-googletest/workflows/Example/badge.svg?branch=master)](https://github.com/srz-zumix/docker-googletest/actions)


[DockerHub](https://hub.docker.com/r/srzzumix/googletest/)

## About

Google Test Docker Container

## How to Use

### GitHub Actions

```yml
name: Example
on: [push]
jobs:
  example:
    runs-on: ubuntu-latest
    container:
      image: docker://srzzumix/googletest:latest
    steps:
    - uses: actions/checkout@master
    - name: your build and test
      run: |
        make
        make test
```

[![GitHub Actions Example Status](https://github.com/srz-zumix/docker-googletest/workflows/Example/badge.svg?branch=master)](https://github.com/srz-zumix/docker-googletest/actions)
 is the actual running sample.
