FROM alpine:3.12

RUN sed -i "s@dl-cdn.alpinelinux.org@mirrors.aliyun.com@g" /etc/apk/repositories && \
    apk add --no-cache nginx tzdata bash php7 php7-ldap php7-mbstring php7-mcrypt php7-filter && \
    ln -s /usr/bin/php7 /usr/bin/php && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* /var/www/localhost/htdocs/*


ENV SSP_VERSION=1.3
ENV TZ=Asia/Shanghai

RUN cd /var/www && wget https://github.com/ltb-project/self-service-password/archive/v${SSP_VERSION}.tar.gz && tar xf v${SSP_VERSION}.tar.gz && rm -rf v${SSP_VERSION}.tar.gz

ADD entrypoint.sh /entrypoint.sh


VOLUME ["/data", "/var/www/build"]

ENTRYPOINT ["sh", "/entrypoint.sh"]
