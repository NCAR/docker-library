FROM centos:7
MAINTAINER Erik Johnson <ej@ucar.edu>

ENV RUBY_VERSION 1.9.3-p545

ENV BUILD_PACKAGES_KEEP make gcc patch tar gcc-c++

ENV BUILD_PACKAGES_TMP autoconf automake libffi-devel openssl-devel zlib-devel bzip2 readline-devel

ENV PACKAGES_RM autoconf perl libselinux-devel m4 keyutils-libs-devel keyutils-libs-devel libcom_err-devel libsepol-devel

COPY src/ruby-install-0.5.0.tar.gz src/ruby-$RUBY_VERSION.tar.bz2 /tmp/

RUN yum install -y $BUILD_PACKAGES_KEEP $BUILD_PACKAGES_TMP && \
    echo 'installing ruby-install' && \
    cd /tmp && \
    tar -xzvf /tmp/ruby-install-0.5.0.tar.gz && \
    cd ruby-install-0.5.0 && \
    make install && \
    cd /tmp && \
    echo 'installing ruby' && \
    ruby-install --system -u file:///tmp/ruby-$RUBY_VERSION.tar.bz2 ruby $RUBY_VERSION && \
    echo 'cleaning up' && \
    rm -rf ruby-$RUBY_VERSION.tar.bz2 /usr/local/src/ruby-$RUBY_VERSION* ruby-install-0.5.0 ruby-install-0.5.0.tar.gz /usr/local/share/ri /usr/local/share/ruby-install && \
    yum -y --setopt=tsflags=noscripts remove $BUILD_PACKAGES_TMP $PACKAGES_RM && \
    yum -y clean all

COPY gemrc /root/.gemrc

# install mysql and dependency for mysql2 gem
RUN yum install -y mariadb mariadb-devel && \
    yum -y clean all

RUN mkdir ~/.ssh && chmod 700 ~/.ssh && \
    yum install -y git

# TODO? install chruby to handle bin/?

# install bundler
RUN gem install bundler

# TODO: for "Warning: You're using Rubygems 1.8.23.2 with Spring. Upgrade to at least Rubygems 2.1.0 and run `gem pristine --all` for better startup performance."
# RUN gem update --system

RUN mkdir /app
WORKDIR /app
