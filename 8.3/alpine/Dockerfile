FROM ghcr.io/104lab/octane:8.3-alpine

LABEL org.opencontainers.image.source="https://github.com/104lab/docker-octane" \
    repository="https://github.com/104lab/docker-octane"

# Set build deps
ENV BUILD_DEPS \
        gmp-dev \
        libxml2-dev

RUN set -xe && \
            apk add --no-cache \
                gmp \
                ${BUILD_DEPS} \
        && \
            docker-php-ext-install \
                gmp \
                soap \
                sockets \
        && \
            apk add --no-cache --virtual .build-deps \
                autoconf \
                g++ \
                make \
        && \
            pecl install \
                mongodb-1.18.1 \
                redis-5.3.7 \
        && \
            docker-php-ext-enable \
                mongodb \
                redis \
        && \
            apk del .build-deps && \
            apk del ${BUILD_DEPS} && \
            php -m
