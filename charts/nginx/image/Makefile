# Export other vars in your shell environment for testing
#
# export NAME=website
# export TLD=com
# export UPSTREAM=helm-name-php
#
USERNAME=supernami
VERSION=1.0

build:
	docker build -t ${USERNAME}/nginx:${VERSION} .

run:
	docker run -it -e NAME=${NAME} -e TLD=${TLD} -e UPSTREAM=${UPSTREAM} ${USERNAME}/nginx

login:
	docker login -u ${USERNAME} -p ${PASSWORD}

tag:
	docker tag ${USERNAME}/nginx:${VERSION} ${USERNAME}/nginx:latest

push:
	docker push ${USERNAME}/nginx:${VERSION} && \
	docker push ${USERNAME}/nginx:latest
