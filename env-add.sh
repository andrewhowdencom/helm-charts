#!/bin/bash

source vars.sh

# APP = kubectl get pods -o json
# NAME = kubectl get pods -o json
# RELEASE = kubectl get pods -o json

echo "export APP=${APP}" >> ~/.bashrc && \
echo "export NAME=${NAME}" >> ~/.bashrc && \
echo "export RELEASE=${RELEASE}" >> ~/.bashrc && \
echo "export DRUPAL_FPM_CONTAINER=${APP}-fpm" >> ~/.bashrc && \
echo "export NGINX_CONTAINER=${APP}-nginx" >> ~/.bashrc
