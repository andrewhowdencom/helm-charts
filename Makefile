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


package: package-drupal package-percona repo-index

package-drupal:
	helm package charts/drupal && \
	mv drupal-${VERSION}.tgz docs

package-percona:
	helm package charts/percona && \
	mv percona-${VERSION}.tgz docs

repo-index:
	helm repo index docs/


rm: rm-docs

rm-docs:
	rm docs/index.yaml
	rm docs/drupal-${VERSION}.tgz && \
	rm docs/percona-${VERSION}.tgz


lint: lint-drupal-fpm lint-percona

lint-drupal:
	helm lint charts/drupal

lint-percona:
	helm lint charts/percona


dry-run: dry-run-drupal dry-run-percona

dry-run-drupal:
	helm install --dry-run --debug charts/drupal

dry-run-percona:
	helm install --dry-run --debug charts/percona


install: install-drupal install-percona

install-drupal:
	helm install charts/drupal

install-percona:
	helm install charts/percona


requirements: drupal-dependencies

drupal-dependencies:
	cd charts/drupal && helm dependency update
