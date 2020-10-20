FROM alpine:3.6

RUN sed -i "s@dl-cdn.alpinelinux.org@mirrors.aliyun.com@g" /etc/apk/repositories && \
    apk add --no-cache curl nginx tzdata bash php7 php7-ldap php7-mbstring php7-mcrypt php7-fpm && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* /var/www/localhost/htdocs/*


ENV SSP_VERSION=1.3
ENV TZ=Asia/Shanghai

RUN cd /var/www && curl -sSL -o v${SSP_VERSION}.tar.gz https://github.com/ltb-project/self-service-password/archive/v${SSP_VERSION}.tar.gz && \
    tar xf v${SSP_VERSION}.tar.gz && mv self-service-password-${SSP_VERSION} ssp && rm -rf v${SSP_VERSION}.tar.gz


ADD entrypoint.sh /entrypoint.sh
ADD default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

VOLUME ["/etc/nginx/", "/var/www/ssp"]
ENTRYPOINT ["sh", "/entrypoint.sh"]
