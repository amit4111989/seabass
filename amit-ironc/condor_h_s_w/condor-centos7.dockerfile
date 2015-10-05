FROM centos:centos7

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install yum-plugin-priorities; yum clean all

RUN rpm -Uvh https://repo.grid.iu.edu/osg/3.3/osg-3.3-el7-release-latest.rpm
# recommended certificate
RUN yum -y install osg-ca-certs
RUN yum -y install condor.x86_64

COPY condor-head-install.sh \

ENTRYPOINT sh condor-head-install.sh