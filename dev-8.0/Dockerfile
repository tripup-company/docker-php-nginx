FROM webdevops/php-nginx-dev:8.0

COPY conf/ /opt/docker/

# Install php extentsions
RUN apt-get update --allow-releaseinfo-change && apt-get install -y \
    nodejs yarn libfreetype6-dev libjpeg62-turbo-dev libpng-dev libicu-dev libmemcached-dev zlib1g-dev libzip-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install zip

ENV MEMCACHE_HOST memcached
ENV MEMCACHE_PORT 11211
ENV APP_URL_PATH ''

VOLUME /app