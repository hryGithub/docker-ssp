FROM alpine:3.11

RUN sed -i "s@dl-cdn.alpinelinux.org@mirrors.aliyun.com@g" /etc/apk/repositories && \
    apk add --no-cache nginx tzdata bash php7 php7-phar php7-openssl php7-session php7-xml php7-ldap php7-mbstring php7-mcrypt php7-fpm && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* /var/www/localhost/htdocs/*


ENV SSP_VERSION=1.4.2
ENV TZ=Asia/Shanghai

ENV LDAP_URL='ldap://localhost:389' \
    LDAP_BASE='dc=example,dc=org' \
    LDAP_BINDDN='cn=admin,dc=example,dc=org' \
    LDAP_BINDPW='passwd' 

ENV MAIL_SMTP_HOST='localhost' \
    MAIL_SMTP_PORT=25 \
    MAIL_SMTP_USER='' \
    MAIL_SMTP_PASS='' 

ENV SITE_URL='http://ldap.example.org' \
    KEYPHRASE='uK9Kargj'

RUN cd /var/www && wget https://github.com/ltb-project/self-service-password/archive/v${SSP_VERSION}.tar.gz && \
    tar xf v${SSP_VERSION}.tar.gz && mv self-service-password-${SSP_VERSION} ssp && rm -rf v${SSP_VERSION}.tar.gz

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD default.conf /etc/nginx/conf.d/default.conf
ADD config.inc.local.php /var/www/ssp/conf/config.inc.local.php

EXPOSE 80

VOLUME ["/etc/nginx/", "/var/www/"]
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
