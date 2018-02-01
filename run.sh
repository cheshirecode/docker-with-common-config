# build and start
docker-compose up --build -d;

# login to container
docker exec -it --user root $CONTAINER_NAME /bin/sh;

# tear-down
docker-compose down;