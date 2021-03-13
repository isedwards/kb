## Linux

Add the user to the group to allow elevated docker commands without sudo prefix: `sudo gpasswd -a $USER docker`

Docker creates a bridge named docker0 by default. Both the docker host and the docker containers have an IP address on that bridge, e.g. `docker run --network="bridge"  # (default)`

On the Docker host, type `sudo ip addr show docker0` for details.

If you use `--network="host"` in your docker run command, then 127.0.0.1 in your docker container [will point to your docker host](https://stackoverflow.com/a/24326540).


## Docker for Windows

Moving docker for windows to an external drive:

- Right-click docker in system tray and stop (equivalent to `sc.exe stop docker`?)
- Open Windows `services`, scroll to "Docker Desktop Service", right-click and stop (equivalent to `dockerd --unregister-serivce`?)
- Move the `C:\Program Files\Docker` to external drive

As administrator:
```
cd D:\Docker\Docker\resources
dockerd --register-service --data-root D:\docker

sc config com.docker.service binPath=D:\Docker\Docker\com.docker.service
```

After running the `sc config` command, if you right-click Docker Desktop Service in Windows `services` and select properties - you'll see the path to exectable has changed.  You can now right-click Docker Desktop Service and `start`.
