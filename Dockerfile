FROM centos:7
#   source=packages|preuse
ARG source=packages
ARG version=1.6.5
RUN yum -y update && yum clean all && yum -y install which curl wget openssl rcs

RUN wget https://openlitespeed.org/$source/openlitespeed-$version.tgz && \
    tar xzvf openlitespeed-$version.tgz && cd openlitespeed && \
    ./install.sh && \
    rm -rf /openlitespeed && \
    rm -f openlitespeed-$version.tgz

EXPOSE 7080

WORKDIR /usr/local/lsws/

CMD ["/usr/local/lsws/bin/openlitespeed","-n"]
