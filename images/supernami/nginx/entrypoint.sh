#!/bin/bash

#set -o errexit
#set -o pipefail

#KUBE_TOKEN=$(</var/run/secrets/kubernetes.io/serviceaccount/token)
#KUBE_NAMESPACE=$(</var/run/secrets/kubernetes.io/serviceaccount/namespace)

#curl -sSk -H "Authorization: Bearer $KUBE_TOKEN" \
#  --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt \
#  https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/$KUBE_NAMESPACE/pods/$HOSTNAME |
#  jq -r .spec.nodeName

if [ ! -f "/done" ]; then

  export NAME=${NAME}
  export TLD=${TLD}
#  export UPSTREAM=${UPSTREAM}

  sed -i "s/website/${NAME}/" /etc/nginx/conf.d/drupal.conf
  sed -i "s/tld/${TLD}/" /etc/nginx/conf.d/drupal.conf
#  sed -i "s/upstream/${UPSTREAM}/" /etc/nginx/conf.d/drupal.conf
#  sed -i "s/upstream/${UPSTREAM}/" /etc/nginx/conf.d/default.conf

  echo "done" >> /done

else
  echo "Entrypoint initialization is already finished"
fi

exec "$@"
