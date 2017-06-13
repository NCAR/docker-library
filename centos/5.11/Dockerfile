FROM centos:5.11
MAINTAINER Erik Johnson <ej@ucar.edu>

#
# update CentOS-Base to reference vault.centos.org:
#
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RUN mkdir -p /var/lib/yum/base /var/lib/yum/updates /var/lib/yum/extra

COPY base-mirrorlist.txt    /var/lib/yum/base/mirrorlist.txt
COPY updates-mirrorlist.txt /var/lib/yum/updates/mirrorlist.txt
COPY extras-mirrorlist.txt  /var/lib/yum/extra/mirrorlist.txt

RUN rm -f /etc/yum.repos.d/libselinux.repo

#
# install EPEL, for netcdf
#
RUN yum -y --enablerepo=extras install epel-release \
    && yum clean all
