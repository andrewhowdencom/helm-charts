VERSION=0.1.0

add-custom-repo:
	helm repo add supernami https://supernami.github.io/helm-charts/

check-config:
	kubectl config view

check-context:
	kubectl config current-context


dev: namespace-dev set-context-dev use-context-prod

namespace-dev:
	kubectl create -f namespaces/namespace-dev.json

set-context-dev:
	kubectl config set-context dev --namespace=development --cluster=${CLUSTER_VAR} --user=${CLUSTER_VAR}

use-context-dev:
	kubectl config use-context dev


prod: namespace-prod set-context-prod use-context-prod

namespace-prod:
	kubectl create -f namespaces/namespace-prod.json

set-context-prod:
	kubectl config set-context prod --namespace=development --cluster=${CLUSTER_VAR} --user=${CLUSTER_VAR}

use-context-prod:
	kubectl config use-context prod


package: package-nginx package-drupal-fpm package-percona repo-index

package-nginx:
	helm package charts/nginx && \
	mv nginx-${VERSION}.tgz docs

package-drupal-fpm:
	helm package charts/drupal-fpm && \
	mv drupal-fpm-${VERSION}.tgz docs

package-percona:
	helm package charts/percona && \
	mv percona-${VERSION}.tgz docs

repo-index:
	helm repo index docs/


rm: rm-docs rm-nginx rm-drupal-fpm

rm-docs:
	rm docs/index.yaml
	rm docs/nginx-${VERSION}.tgz && \
	rm docs/drupal-fpm-${VERSION}.tgz && \
	rm docs/percona-${VERSION}.tgz

rm-nginx:
	rm charts/nginx/requirements.lock && \
	rm charts/nginx/charts/drupal-fpm-${VERSION}.tgz && \
	rm charts/nginx/charts/mariadb-0.5.2.tgz

rm-drupal-fpm:
	rm charts/drupal-fpm/requirements.lock && \
	rm charts/drupal-fpm/charts/nginx-${VERSION}.tgz && \
	rm charts/drupal-fpm/charts/mariadb-0.5.2.tgz


lint: lint-nginx lint-drupal-fpm lint-percona

lint-nginx:
	helm lint charts/nginx

lint-drupal-fpm:
	helm lint charts/drupal-fpm

lint-percona:
	helm lint charts/percona


dry-run: dry-run-drupal dry-run-nginx dry-run-drupal-fpm dry-run-percona

dry-run-drupal:
	helm install --dry-run --debug charts/drupal

dry-run-nginx:
	helm install --dry-run --debug charts/nginx

dry-run-drupal-fpm:
	helm install --dry-run --debug charts/drupal-fpm

dry-run-percona:
	helm install --dry-run --debug charts/percona


install: install-drupal install-nginx install-drupal-fpm install-percona

install-drupal:
	helm install charts/drupal

install-nginx:
	helm install charts/nginx

install-drupal-fpm:
	helm install charts/drupal-fpm

install-percona:
	helm install charts/percona


requirements: drupal-dependencies

drupal-dependencies:
	cd charts/drupal && helm dependency update

nginx-dependencies:
	cd charts/nginx && helm dependency update

drupal-fpm-dependencies:
	cd charts/drupal-fpm && helm dependency update
