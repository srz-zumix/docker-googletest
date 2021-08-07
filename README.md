# docker-googletest

[![Docker Build](https://github.com/srz-zumix/docker-googletest/actions/workflows/docker-build.yml/badge.svg)](https://github.com/srz-zumix/docker-googletest/actions/workflows/docker-build.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/srzzumix/googletest)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e44a06fa5dfa4b35bc457714a4e1161a)](https://app.codacy.com/app/srz-zumix/docker-googletest?utm_source=github.com&utm_medium=referral&utm_content=srz-zumix/docker-googletest&utm_campaign=Badge_Grade_Dashboard)
[![GitHub Actions Status](https://github.com/srz-zumix/docker-googletest/workflows/Example/badge.svg?branch=master)](https://github.com/srz-zumix/docker-googletest/actions)

<!-- [![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/srzzumix/googletest)](https://hub.docker.com/r/srzzumix/googletest/) -->

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
