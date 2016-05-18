docker-compose down; docker-compose rm -f
docker volume rm $(docker volume ls -qf dangling=true)
git pull
docker-compose up