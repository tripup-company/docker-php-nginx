FROM webdevops/php-nginx:7.1
COPY conf/health.php /app/health.php
COPY conf/ /opt/docker/

# Install gcsfuse npm nodejs grunt
RUN echo "deb http://packages.cloud.google.com/apt gcsfuse-jessie main" | tee /etc/apt/sources.list.d/gcsfuse.list; \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -; \
    curl -sL https://deb.nodesource.com/setup_9.x | bash -

# installs memcached and enables it in apache
RUN apt-get update && apt-get install -y gcsfuse libmemcached-dev zlib1g-dev \
    && apt-get install -y php7.0-intl
    && docker-php-ext-enable memcached
ENV MEMCACHE_HOST memcached
ENV MEMCACHE_PORT 11211
ENV APP_URL_PATH ''
