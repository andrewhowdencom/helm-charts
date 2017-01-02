#!/bin/bash
source vars.sh

sed -i "/export\ CLUSTER_VAR=${CLUSTER_VAR}/d" /home/user/.bashrc
sed -i "/export\ APP=${APP}/d" /home/user/.bashrc
sed -i "/export\ NAME=${NAME}/d" /home/user/.bashrc
sed -i "/export\ RELEASE=${RELEASE}/d" /home/user/.bashrc
sed -i "/export\ DRUPAL_FPM_CONTAINER=${APP}-fpm/d" /home/user/.bashrc
sed -i "/export\ NGINX_CONTAINER=${APP}-nginx/d" /home/user/.bashrc
