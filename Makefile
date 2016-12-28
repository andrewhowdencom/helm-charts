VERSION=0.1.0

add-custom-repo:
	helm repo add supernami https://supernami.github.io/helm-charts/


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


rm: rm-index rm-nginx rm-drupal-fpm rm-mariadb rm-percona rm-requirements-lock

rm-index:
	rm docs/index.yaml

rm-nginx:
	rm docs/nginx-${VERSION}.tgz && \
	rm charts/drupal-fpm/charts/nginx-${VERSION}.tgz

rm-drupal-fpm:
	rm docs/drupal-fpm-${VERSION}.tgz && \
	rm charts/nginx/charts/drupal-fpm-${VERSION}.tgz

rm-mariadb:
	rm charts/drupal-fpm/charts/mariadb-0.5.2.tgz && \
	rm charts/nginx/charts/mariadb-0.5.2.tgz

rm-percona:
	rm docs/percona-${VERSION}.tgz

rm-requirements-lock:
	rm charts/drupal-fpm/requirements.lock && \
	rm charts/nginx/requirements.lock


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


requirements: drupal-fpm-dependencies

nginx-dependencies:
	cd charts/nginx && helm dependency update

drupal-fpm-dependencies:
	cd charts/drupal-fpm && helm dependency update
