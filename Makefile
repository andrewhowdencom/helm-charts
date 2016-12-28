VERSION=0.1.0

dependency-update:
	helm dependency update

repo-index:
	helm repo index docs/

add-custom-repo:
	helm repo add supernami https://supernami.github.io/helm-charts/


package: package-nginx package-drupal-fpm package-percona

package-nginx:
	helm package charts/nginx && \
	mv nginx-${VERSION}.tgz docs

package-drupal-fpm:
	helm package charts/drupal-fpm && \
	mv drupal-fpm-${VERSION}.tgz docs

package-percona:
	helm package charts/percona && \
	mv percona-${VERSION}.tgz docs


rm-packages: rm-index rm-nginx rm-drupal-fpm rm-percona

rm-index:
	rm docs/index.yaml

rm-nginx:
	rm docs/nginx-${VERSION}.tgz

rm-drupal-fpm:
	rm docs/drupal-fpm-${VERSION}.tgz

rm-percona:
	rm docs/percona-${VERSION}.tgz


lint: lint-nginx lint-drupal-fpm lint-percona

lint-nginx:
	helm lint charts/nginx

lint-drupal-fpm:
	helm lint charts/drupal-fpm

lint-percona:
	helm lint charts/percona


dry-run: dry-run-nginx dry-run-drupal-fpm dry-run-percona

dry-run-nginx:
	helm install --dry-run --debug charts/nginx

dry-run-drupal-fpm:
	helm install --dry-run --debug charts/drupal-fpm

dry-run-percona:
	helm install --dry-run --debug charts/percona


install: install-nginx install-drupal-fpm install-percona

install-nginx:
	helm install charts/nginx

install-drupal-fpm:
	helm install charts/drupal-fpm

install-percona:
	helm install charts/percona
