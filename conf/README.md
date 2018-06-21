This folder contains settings for docker container. 
All folders will be copied to root directory.

If you need to overwirte some server configuration, just create a folder path and add a file. 
=========================================== 
We have to overwrite ngnix configuration because we have 2 applications, those should be served on different ports. 
- /etc/nginx/nginx.conf

More informationa about customization see here https://dockerfile.readthedocs.io/en/latest/content/Customization/index.html
