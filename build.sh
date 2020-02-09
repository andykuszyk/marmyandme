#!/bin/bash
commit=$(git log -n 1 --oneline | sed 's/\(.......\).*/\1/')
docker build -t andykuszyk/marmyandme:$commit . 
docker push andykuszyk/marmyandme:$commit
