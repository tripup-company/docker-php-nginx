# Replace markers
go-replace \
    -s "<APP_URL_PATH>" -r "$APP_URL_PATH" \
    --path=/opt/docker/etc/nginx/ \
    --path-pattern='*.conf' \
    --ignore-empty
