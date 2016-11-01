# based on / adapted from:
# https://github.com/docker-library/buildpack-deps/blob/a0a59c61102e8b079d568db69368fb89421f75f2/jessie/curl/Dockerfile

FROM debian:jessie
MAINTAINER Erik Johnson <ej@ucar.edu>

# from buildpack-deps:jessie-curl

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    # wget \
  && rm -rf /var/lib/apt/lists/*

# https://github.com/docker-library/buildpack-deps/blob/11492c68d993221fd5cd4d8a980354634fc165dd/jessie/Dockerfile

RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    bzip2 \
    file \
    g++ \
    gcc \
    libc6-dev \
    libffi-dev \
    libglib2.0-dev \
    libmysqlclient-dev \
    libncurses-dev \
    libreadline-dev \
    libssl-dev \
    libtool \
    libwebp-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    make \
    patch \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/etc \
  && { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.5
ENV RUBY_DOWNLOAD_SHA256 30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3

COPY ruby-2.2.5.tar.gz /tmp/ruby.tar.gz

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
RUN set -ex \
  && buildDeps=' \
    bison \
    libgdbm-dev \
    ruby \
  ' \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && echo "$RUBY_DOWNLOAD_SHA256 /tmp/ruby.tar.gz" | sha256sum -c - \
  && mkdir -p /usr/src/ruby \
  && tar -xzf /tmp/ruby.tar.gz -C /usr/src/ruby --strip-components=1 \
  && rm /tmp/ruby.tar.gz \
  && cd /usr/src/ruby \
  && { echo '#define ENABLE_PATH_CHECK 0'; echo; cat file.c; } > file.c.new && mv file.c.new file.c \
  && autoconf \
  && ./configure --disable-install-doc \
  && make -j"$(nproc)" \
  && make install \
  && apt-get purge -y --auto-remove $buildDeps \
  && gem update --system \
  && rm -r /usr/src/ruby \
  && rm -rf /usr/local/lib/ruby/gems/2.2.0/cache /var/log/dpkg.log /var/log/apt/*

RUN gem install bundler \
  && rm -rf /usr/local/lib/ruby/gems/2.2.0/cache

RUN mkdir /app
WORKDIR /app

CMD [ "irb" ]
