FROM ghcr.io/104lab/octane:8.2

LABEL org.opencontainers.image.source="https://github.com/104lab/docker-lazy-octane" \
    repository="https://github.com/104lab/docker-lazy-octane"

# Set build deps
ENV BUILD_DEPS \
        libcurl4-openssl-dev \
        libgmp-dev \
        libssl-dev \
        libxml2-dev \
        pkg-config \
        rsyslog

RUN set -xe && \
            apt-get update && \
            apt-get install --yes --no-install-recommends --no-install-suggests \
                ${BUILD_DEPS} \
        && \
            docker-php-ext-install \
                gmp \
                soap \
                sockets \
                bcmath \
        && \
            pecl install \
                mongodb-1.12.0 \
                redis-5.3.6 \
        && \
            docker-php-ext-enable \
                mongodb \
                redis \
        && \
            apt-get remove --purge -y ${BUILD_DEPS} && \
            apt-get autoremove --purge -y && \
            rm -r /var/lib/apt/lists/* && \
            php -m
