# based on https://github.com/docker-library/ruby/blob/2d6449f03976ededa14be5cac1e9e070b74e4de4/2.2/alpine/Dockerfile
FROM alpine:3.4

MAINTAINER Erik Johnson <ej@ucar.edu>

#
# skip installing gem documentation
#
RUN mkdir -p /usr/local/etc \
  && { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.5
ENV RUBY_DOWNLOAD_SHA256 30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3

# ENV RUBY_MAJOR 2.3
# ENV RUBY_VERSION 2.3.1
# ENV RUBY_DOWNLOAD_SHA256 b87c738cb2032bf4920fef8e3864dc5cf8eae9d89d8d523ce0236945c5797dcd

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
RUN set -ex \
  && apk add --no-cache --virtual .ruby-builddeps \
    autoconf \
    bison \
    bzip2 \
    bzip2-dev \
    ca-certificates \
    coreutils \
    curl \
    gdbm-dev \
    glib-dev \
    libc-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    ncurses-dev \
    openssl-dev \
    procps \
# https://bugs.ruby-lang.org/issues/11869 and https://github.com/docker-library/ruby/issues/75
    readline-dev \
    ruby \
    yaml-dev \
    zlib-dev \
  && apk add --update gcc g++ make linux-headers nodejs tzdata mariadb-dev\
  && curl -fSL -o ruby.tar.gz "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.gz" \
  && echo "$RUBY_DOWNLOAD_SHA256 *ruby.tar.gz" | sha256sum -c - \
  && mkdir -p /usr/src \
  && tar -xzf ruby.tar.gz -C /usr/src \
  && mv "/usr/src/ruby-$RUBY_VERSION" /usr/src/ruby \
  && rm ruby.tar.gz \
  && cd /usr/src/ruby \
  && { echo '#define ENABLE_PATH_CHECK 0'; echo; cat file.c; } > file.c.new && mv file.c.new file.c \
  && autoconf \
  # the configure script does not detect isnan/isinf as macros
  && ac_cv_func_isnan=yes ac_cv_func_isinf=yes \
    ./configure --disable-install-doc \
  && make -j"$(getconf _NPROCESSORS_ONLN)" \
  && make install \
  && runDeps="$( \
    scanelf --needed --nobanner --recursive /usr/local \
      | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
      | sort -u \
      | xargs -r apk info --installed \
      | sort -u \
  )" \
  && apk add --virtual .ruby-rundeps $runDeps \
    bzip2 \
    ca-certificates \
    curl \
    libffi-dev \
    openssl-dev \
    yaml-dev \
    procps \
    zlib-dev \
  && apk del .ruby-builddeps \
  && gem update --system \
  && rm -rf /usr/src/ruby

# RUN gem install bundler --version "$BUNDLER_VERSION"
RUN gem install bundler \
  && rm -rf /usr/local/lib/ruby/gems/2.2.0/cache

RUN mkdir /app
WORKDIR /app

CMD [ "irb" ]
