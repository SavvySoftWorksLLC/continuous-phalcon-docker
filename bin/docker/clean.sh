docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi
docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes
