FROM nginx
COPY config/nginx/etc/conf.d/fly.conf /etc/nginx/conf.d/nginx.conf
