FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN rm /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh