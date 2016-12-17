dependency-update:
	helm dependency update

repo-index:
	cd docs && helm repo index

add-custom-repo:
	helm repo add supernami https://supernami.github.io/helm-charts/


package: package-nginx package-percona package-drupal-fpm

package-nginx:
	helm package charts/nginx && \
	mv nginx-0.1.0.tgz docs

package-percona:
	helm package charts/percona && \
	mv percona-0.1.0.tgz docs

package-drupal-fpm:
	helm package charts/drupal-fpm && \
	mv drupal-fpm-0.1.0.tgz docs


lint: lint-nginx lint-percona lint-drupal-fpm

lint-nginx:
	helm lint nginx

lint-percona:
	helm lint percona

lint-drupal-fpm:
	helm lint drupal-fpm


dry-run: dry-run-nginx dry-run-percona dry-run-drupal-fpm

dry-run-nginx:
	helm install --dry-run --debug nginx

dry-run-percona:
	helm install --dry-run --debug percona

dry-run-drupal-fpm:
	helm install --dry-run --debug drupal-fpm


install: install-nginx install-percona install-drupal-fpm

install-nginx:
	helm install nginx

install-percona:
	helm install percona

install-drupal-fpm:
	helm install drupal-fpm
