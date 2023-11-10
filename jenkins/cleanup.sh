# clean up
docker rm -f $(docker ps -a)
docker rmi -f $(docker images)
docker builder prune --all --force
docker network rm node-network