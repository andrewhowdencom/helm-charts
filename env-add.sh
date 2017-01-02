#!/bin/bash
source vars.sh

echo "export CLUSTER_VAR=${CLUSTER_VAR}" >> ~/.bashrc
echo "export APP=${APP}" >> ~/.bashrc
echo "export NAME=${NAME}" >> ~/.bashrc
echo "export RELEASE=${RELEASE}" >> ~/.bashrc
echo "export DRUPAL_FPM_CONTAINER=${APP}-fpm" >> ~/.bashrc
echo "export NGINX_CONTAINER=${APP}-nginx" >> ~/.bashrc
