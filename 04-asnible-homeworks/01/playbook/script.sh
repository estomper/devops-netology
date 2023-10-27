#!/bin/bash
path=~/git/netology/devops-netology/04-asnible-homeworks/01/playbook
docker start ubuntu centos7 fedora
ansible-playbook ${path}/site.yml -i ${path}/inventory/prod.yml --vault-password-file=${path}/vault
docker stop ubuntu centos7 fedora