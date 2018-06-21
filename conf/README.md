This image is based on https://github.com/webdevops/Dockerfile
If you start your application on some subpath like domain.com/myapp, you should set
environment variable APP_URL_PATH=myapp. It will remove /myapp from uri, so nginx will be able to route to index.php

This folder contains settings for docker container. 
All folders will be copied to root directory. 
If you need to overwirte some server configuration, just create a folder pathh and add a file. 
=========================================== 
We have to overwrite ngnix configuration because we have 2 applications, those should be served on different ports. 
- /etc/nginx/nginx.conf

More informationa about customization see here https://dockerfile.readthedocs.io/en/latest/content/Customization/index.html