FROM million12/centos-supervisor
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

#ADD container-files /
#ADD . /opt/go/src/github.com/QubitProducts/bamboo
WORKDIR /opt/go/src/github.com/QubitProducts/bamboo

ENV GOPATH /opt/go

RUN \
    yum update -y && \
    yum install -y golang git mercurial && \
    yum clean all && \
    git clone https://github.com/QubitProducts/bamboo.git . && \
    go get github.com/tools/godep && \
    go get -t github.com/smartystreets/goconvey && \
    /opt/go/bin/godep restore && \
    go build && \
    ln -s /opt/go/src/github.com/QubitProducts/bamboo /var/bamboo

EXPOSE 80 8000