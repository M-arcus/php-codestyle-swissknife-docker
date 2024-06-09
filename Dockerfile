FROM ghcr.io/m-arcus/php-codestyle-swissknife-docker:base

## uncomment this for local build
#FROM cgr.dev/chainguard/wolfi-base:latest
#RUN apk add --no-cache \
#    curl \
#    zip \
#    composer \
#    php-8.2 \
#    php-8.2-ctype \
#    php-8.2-curl \
#    php-8.2-dom \
#    php-8.2-fileinfo \
#    php-8.2-gd \
#    php-8.2-iconv \
#    php-8.2-intl \
#    php-8.2-mbstring \
#    php-8.2-mysqlnd \
#    php-8.2-openssl \
#    php-8.2-pdo \
#    php-8.2-pdo_mysql \
#    php-8.2-pdo_sqlite \
#    php-8.2-phar \
#    php-8.2-redis \
#    php-8.2-simplexml \
#    php-8.2-soap \
#    php-8.2-sodium \
#    php-8.2-xml \
#    php-8.2-zip && \
#    rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

LABEL org.opencontainers.image.authors="M-arcus" \
      org.opencontainers.image.url="https://github.com/M-arcus/php-codestyle-swissknife-docker" \
      org.opencontainers.image.documentation="https://github.com/M-arcus/php-codestyle-swissknife-docker/blob/main/README.md" \
      org.opencontainers.image.source="https://github.com/M-arcus/php-codestyle-swissknife-docker" \
      org.opencontainers.image.vendor="M-arcus" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="PHP Code Style Swissknife Docker"

# Set php settings
COPY php.ini /etc/php/conf.d/99-docker.ini

# Install composer and composer packages
ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH /composer/vendor/bin:$PATH
COPY composer.json composer.lock /composer/
RUN composer global install -d /composer/ --optimize-autoloader --no-interaction --no-progress --prefer-dist --no-dev && \
    composer global clearcache && \
    rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

# setup phpstan pro
ENV PHPSTAN_PRO_WEB_PORT=11111
EXPOSE "${PHPSTAN_PRO_WEB_PORT}"

# Set volume and workdir
VOLUME /app
WORKDIR /app

CMD echo 'PHP Code Style Swissknife Docker' && \
    echo '--------------------------------' && \
    echo 'Try the following commands:' && \
    ls /composer/vendor/bin
