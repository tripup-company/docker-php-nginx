# docker-php-nginx-7.1
Docker image configuration for laravel with php7.1, nginx, memcached lib
========
This image is based on https://github.com/webdevops/Dockerfile
If you start your application on some subpath like domain.com/myapp, you should set
environment variable **APP_URL_PATH**=/myapp. It will remove /myapp from uri, so nginx will be able to route to index.php
```Dockerfile
FROM tripup/php-nginx:7.1
ADD . /app
#Clean up folder.
RUN cd /app && rm -rf Dockerfile
ENV WEB_DOCUMENT_ROOT /app/public
ENV APP_URL_PATH /myapp
```

