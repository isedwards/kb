## Linux

Add the user to the group to allow elevated docker commands without sudo prefix: `sudo gpasswd -a $USER docker`

Docker creates a bridge named docker0 by default. Both the docker host and the docker containers have an IP address on that bridge, e.g. `docker run --network="bridge"  # (default)`

On the Docker host, type `sudo ip addr show docker0` for details.

If you use `--network="host"` in your docker run command, then 127.0.0.1 in your docker container [will point to your docker host](https://stackoverflow.com/a/24326540).

<!--
## Docker for Windows

Moving docker for windows to an external drive:

- Right-click docker in system tray and stop
`sc.exe stop docker`

cd C:\Program Files\Docker\Docker\resources
dockerd --unregister-serivce
dockered --register-service --data-root D:\docker

sc.exe config com.docker.service binPath=“D:\Program Files\Docker\com.docker.service”
I spent a lot of times figuring out errors occurring in this step like

Set-Content : A positional parameter cannot be found that accepts argument
‘binPath=D:\Program\Docker\Docker\com.docker.service’.

If you see this error, just change sc to sc.exe.
-->
