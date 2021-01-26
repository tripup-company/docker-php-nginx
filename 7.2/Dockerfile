FROM webdevops/php-nginx:7.2
COPY conf/ /opt/docker/

RUN wget -O /usr/local/bin/php-fpm-healthcheck \
https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck \
&& chmod +x /usr/local/bin/php-fpm-healthcheck

# Install gcsfuse npm nodejs grunt
RUN echo "deb http://packages.cloud.google.com/apt gcsfuse-jessie main" | tee /etc/apt/sources.list.d/gcsfuse.list; \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -; \
    curl -sL https://deb.nodesource.com/setup_9.x | bash -
# Install php extentsions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev libicu-dev gcsfuse libmemcached-dev zlib1g-dev libzip-dev libfcgi-bin \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install zip \
    && docker-php-ext-install exif

ENV MEMCACHE_HOST memcached
ENV MEMCACHE_PORT 11211
ENV APP_URL_PATH ''
