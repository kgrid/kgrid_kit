#!/bin/bash
echo Assests from repo $1

artifacts=($(curl -s $1 | jq -r ".assets[].browser_download_url"))

for url in "${artifacts[@]}"
do
	curl -s -L -O $url
done