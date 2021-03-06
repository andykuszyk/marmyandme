#!/bin/bash
commit=$(git log -n 1 --oneline | sed 's/\(.......\).*/\1/')
docker build -t andykuszyk/marmyandme:$commit . 
docker push andykuszyk/marmyandme:$commit
git clone https://andykuszyk:$GITHUB_TOKEN@github.com/andykuszyk/do-docker
cd do-docker
make release-service SERVICE=marmyandme TAG=$commit
