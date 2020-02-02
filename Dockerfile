FROM centos:7
RUN yum -y update && yum clean all && yum -y install which curl wget openssl rcs
RUN rpm -ivh http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el7.noarch.rpm
RUN yum -y install epel-release &&  yum install -y openlitespeed
 
EXPOSE 7080

WORKDIR /usr/local/lsws/
 
CMD ["/usr/local/lsws/bin/openlitespeed","-n"]