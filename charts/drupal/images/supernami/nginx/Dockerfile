FROM nginx:latest

COPY config/default.conf /etc/nginx/conf.d/default.conf
COPY config/drupal.conf /etc/nginx/conf.d/drupal.conf

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
