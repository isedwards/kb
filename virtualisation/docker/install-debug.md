## Docker installation

Although it may be easer, let's not used the [snap package](https://askubuntu.com/a/1400162) or the old version from the `apt` repositories.

Copy commands from [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/) (jump directly to [using the apt repository](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) if a fresh install). Also see the `tip` box with the link for [Linux postinstall](https://docs.docker.com/engine/install/linux-postinstall)

See also: [databases/README.md](https://github.com/isedwards/kb/blob/master/databases/README.md)

## Debugging

If the container won't start then add `command: sleep 3600  # sleep for 1h whilst we debug the container` to the service in `docker-compose.yml`

`docker exec -it <container-name> bash`

If you change the container config, you can delete the old version with:
```
# docker rmi <image-name> --force
docker compose build --no-cache <service-name>
docker compose up <service-name>  # --detach
```

## Nuke option

```
# Stop all running containers
docker stop $(docker ps -aq)
# Remove all containers
docker rm $(docker ps -aq)
# Delete all images
docker rmi -f $(docker images -aq)
# Clear cache and free up disk space (note -af: force all option)
# Warning: this is deleting all local volumes as well
docker system prune -af
```

You can also remove all local volumes (are you sure you want to do that?)
```
docker volume rm $(docker volume ls -q)
```

Also see [Uninstalling old docker versions](https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions).

## Networking

Docker creates a bridge named docker0 by default. Both the docker host and the docker containers have an IP address on that bridge, e.g. `docker run --network="bridge"  # (default)`

On the Docker host, type `sudo ip addr show docker0` for details.

If you use `--network="host"` in your docker run command, then 127.0.0.1 in your docker container [will point to your docker host](https://stackoverflow.com/a/24326540).
