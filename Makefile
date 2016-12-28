VERSION=0.1.0

dependency-update:
	helm dependency update

repo-index:
	helm repo index docs/

add-custom-repo:
	helm repo add supernami https://supernami.github.io/helm-charts/


package: package-nginx package-percona package-drupal-fpm

package-nginx:
	helm package charts/nginx && \
	mv nginx-${VERSION}.tgz docs

package-percona:
	helm package charts/percona && \
	mv percona-${VERSION}.tgz docs

package-drupal-fpm:
	helm package charts/drupal-fpm && \
	mv drupal-fpm-${VERSION}.tgz docs


lint: lint-nginx lint-percona lint-drupal-fpm

lint-nginx:
	helm lint charts/nginx

lint-percona:
	helm lint charts/percona

lint-drupal-fpm:
	helm lint charts/drupal-fpm


dry-run: dry-run-nginx dry-run-percona dry-run-drupal-fpm

dry-run-nginx:
	helm install --dry-run --debug charts/nginx

dry-run-percona:
	helm install --dry-run --debug charts/percona

dry-run-drupal-fpm:
	helm install --dry-run --debug charts/drupal-fpm


install: install-nginx install-percona install-drupal-fpm

install-nginx:
	helm install charts/nginx

install-percona:
	helm install charts/percona

install-drupal-fpm:
	helm install charts/drupal-fpm
