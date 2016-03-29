FROM httpd:2.2.31
# https://hub.docker.com/_/httpd/
# https://github.com/docker-library/httpd/blob/5b81416f52f626f087a4a08b50adaa65271ee69c/2.2/Dockerfile

MAINTAINER Erik Johnson <ej@ucar.edu>

ENV HTTPD_PREFIX /usr/local/apache2

# install mod_proxy and mod_rewrite
# https://forum.ivorde.com/apache-2-2-installation-of-mod-rewrite-module-without-recompiling-whole-apache-t67.html
COPY modules /tmp/httpd/modules/
RUN apt-get update \
    && apt-get install -y gcc \
    && apxs -c -i /tmp/httpd/modules/proxy/mod_proxy.c /tmp/httpd/modules/proxy/proxy_util.c \
    && apxs -c -i /tmp/httpd/modules/proxy/mod_proxy_http.c  /tmp/httpd/modules/proxy/proxy_util.c \
    && apxs -c -i /tmp/httpd/modules/mod_rewrite.c \
    && rm -r /var/lib/apt/lists/* /tmp/httpd \
    && apt-get purge -y --auto-remove gcc

RUN echo 'LoadModule proxy_module modules/mod_proxy.so' >> $HTTPD_PREFIX/conf/httpd.conf
RUN echo 'LoadModule proxy_http_module modules/mod_proxy_http.so' >> $HTTPD_PREFIX/conf/httpd.conf
RUN echo 'LoadModule rewrite_module modules/mod_rewrite.so' >> $HTTPD_PREFIX/conf/httpd.conf
