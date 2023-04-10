## Docker installation

Installing docker is a one time pain. Follow docker install instructions...
  https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

  * Check that the key file is generated: ls /etc/apt/keyrings/docker.gpg
   (sometimes it doesn't work if you paste more than one line at a time)
  * The current instructions for adding the deb package don't work unless line breaks are removed:

```
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

`sudo usermod -aG docker ubuntu` (then log in again)

Although it a lot easer, let's not used the snap package https://askubuntu.com/a/1400162

See also: [databases/README.md](https://github.com/isedwards/kb/blob/master/databases/README.md)

## Linux

Add the user to the group to allow elevated docker commands without sudo prefix (the log out and log in again): 
``
sudo groupadd docker
sudo gpasswd -a $USER docker`
```

Docker creates a bridge named docker0 by default. Both the docker host and the docker containers have an IP address on that bridge, e.g. `docker run --network="bridge"  # (default)`

On the Docker host, type `sudo ip addr show docker0` for details.

If you use `--network="host"` in your docker run command, then 127.0.0.1 in your docker container [will point to your docker host](https://stackoverflow.com/a/24326540).


## Docker for Windows

Docker for Windows isn't designed to run from anywhere other than the primary hard drive. I followed some instructions (commented in this page) to try to move it, but ultimately it failed. On Windows, I'm currently running docker from the commandline in a Hyper-V VM (not yet ready to try/trust docker in WSL).

<!--
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
-->

For managing and working with WSL (including moving to an external drive), I use: https://github.com/DDoSolitary/LxRunOffline (WSL [requires NTFS drive](https://github.com/DDoSolitary/LxRunOffline/issues/163))
