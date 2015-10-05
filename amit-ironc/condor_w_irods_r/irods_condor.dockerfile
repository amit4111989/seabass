FROM centos:centos7

RUN yum -y update;yum clean all
RUN yum -y install sudo epel-release;yum clean all

RUN rpm -ivh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm
RUN yum install postgresql93 postgresql93-server postgresql93-libs postgresql93-contrib postgresql93-devel; yum clean all
RUN /usr/pgsql-9.3/bin/postgresql93-setup initdb
RUN systemctl start postgresql-9.3.service

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/p/python-jsonschema-2.3.0-1.el7.noarch.rpm
RUN rpm -ivh http://dl.fedoraproject.org/pub/fedora/linux/releases/21/Everything/x86_64/os/Packages/p/python-psutil-1.2.1-5.fc21.x86_64.rpm

ENTRYPOINT sh ironc1-install.sh

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install yum-plugin-priorities; yum clean all

RUN rpm -Uvh https://repo.grid.iu.edu/osg/3.3/osg-3.3-el7-release-latest.rpm
# recommended certificate
RUN yum -y install osg-ca-certs
RUN yum -y install condor.x86_64

COPY ironc3-install.sh /
COPY condor-head-install.sh /

ENTRYPOINT sh ironc3-install.sh
