# https://hub.docker.com/_/centos/
FROM centos:7.2.1511
MAINTAINER Erik Johnson <ej@ucar.edu>

# https://github.com/ncareol/eol-django-datavis/blob/master/README-devel.rst

RUN rpm -ihv http://www.eol.ucar.edu/software/rpms/eol-repo-epel-1-3.noarch.rpm

#
# basic python stuff
#

RUN yum install -y python3 python3-devel \
    && yum -y clean all

COPY src/get-pip.py /tmp
RUN python3 /tmp/get-pip.py \
    && rm /tmp/get-pip.py

#
# basic django stuff
#

# TODO: lock version(s)
RUN python3 -m pip install "django<1.9"
RUN python3 -m pip install --upgrade pylint_django
RUN python3 -m pip install --upgrade pytz

#
# tools for managing static files
#
# EPEL, required for npm and netcdf-devel, hdf3-devel

RUN rpm -ivh http://download.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# RUN yum install -y npm
# RUN npm install -g bower
# FIXME: install git, required by bower

#
# datavis stuff
#

RUN yum install -y netcdf-devel hdf5-devel postgresql-devel gcc \
    && yum -y clean all

# TODO: lock version(s)

# python3 -m pip install --upgrade django
RUN python3 -m pip install --upgrade numpy
RUN python3 -m pip install --upgrade netCDF4
RUN python3 -m pip install --upgrade psycopg2

RUN python3 -m pip install django-datetime-widget
RUN python3 -m pip install django-timezone-field

# FIXME: does this need to be installed via yum AND pip?
RUN python3 -m pip install python3-memcached

RUN mkdir /app
WORKDIR /app
