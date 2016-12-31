#!/bin/bash

source vars.sh

# APP = kubectl get pods -o json
# NAME = kubectl get pods -o json
# RELEASE = kubectl get pods -o json

sed -i "/export\ APP=${APP}/d" /home/user/.bashrc
sed -i "/export\ NAME=${NAME}/d" /home/user/.bashrc
sed -i "/export\ RELEASE=${RELEASE}/d" /home/user/.bashrc
sed -i "/export\ DRUPAL_FPM_CONTAINER=${UNIQUE}-fpm/d" /home/user/.bashrc
sed -i "/export\ NGINX_CONTAINER=${UNIQUE}-nginx/d" /home/user/.bashrc
