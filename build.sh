#!/bin/bash
commit=$(git log -n 1 --oneline | sed 's/\(.......\).*/\1/')
docker build -t andykuszyk/marmyandme:$commit . 
docker push andykuszyk/marmyandme:$commit
sed -i "s/\[version\]/$commit/g" docker-compose.yml
scp -o -i id_rsa "StrictHostKeyChecking no" ./docker-compose.yml $douser@$doip:~/docker-compose.yml
ssh -o -i id_rsa "StrictHostKeyChecking no" $douser@$doip "docker stack deploy -c ~/docker-compose.yml szyk"
