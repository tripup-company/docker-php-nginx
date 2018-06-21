FROM webdevops/php-nginx:7.1
COPY conf/ /opt/docker/
# installs memcached and enables it in apache
RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev \
    && pecl install memcached-3.0.3 \
    && docker-php-ext-enable memcached
ADD . /app
#Clean up folder.
RUN cd /app && rm -rf client-secret.json Dockerfile bitbucket-pipelines.yml package-lock.json package.json readme.md composer.json composer.lock Gruntfile.js image-files/
ENV WEB_DOCUMENT_ROOT /app/public
ENV MEMCACHE_HOST ${MEMCACHE_HOST:-'memcached'}
ENV MEMCACHE_PORT ${MEMCACHE_PORT:-'11211'}
EXPOSE 80/tcp
