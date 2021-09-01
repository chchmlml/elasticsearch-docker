#!/bin/sh

HERE=$(cd $(dirname "$0"); pwd)

source "$HERE/common.sh"

local_ip=""
getIpAddr
export LOCAL_IP=${local_ip}

echo "\033[036m -->获取ip（mac本地） ${LOCAL_IP} \033[0m"

echo "\033[036m -->创建elasticsearch.yml \033[0m"
envsubst < ./elasticsearch.yml.tmpl > ./es/config/elasticsearch.yml

echo "\033[036m -->创建kibana.yml \033[0m"
envsubst < ./kibana.yml.tmpl > ./kibana/kibana.yml

echo "\033[036m -->开始启动docker \033[0m"
sudo docker-compose up -d

echo "\033[036m -->DONE \033[0m"