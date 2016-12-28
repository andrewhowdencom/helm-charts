#!/bin/bash

if [ ! -f "/done" ]; then

  export NAME=${NAME}
  export TLD=${TLD}
  export UPSTREAM=${UPSTREAM}

  sed -i "s/website/${NAME}/" /etc/nginx/conf.d/drupal.conf
  sed -i "s/tld/${TLD}/" /etc/nginx/conf.d/drupal.conf
  sed -i "s/upstream/${UPSTREAM}/" /etc/nginx/conf.d/drupal.conf
  sed -i "s/upstream/${UPSTREAM}/" /etc/nginx/conf.d/default.conf

  echo "done" >> /done

else
  echo "Entrypoint initialization is already finished"
fi

exec "$@"
