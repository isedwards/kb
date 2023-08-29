Separate servers by local/remote and by project with `Include` directives in `~/.ssh/config`, e.g.:
```
Include ~/.ssh/dev/config
```

`~/.ssh/dev/config`:
```
# VM: `U22.04S4GB - myproj` (Ubuntu 22.04 Server 4Gb memory)
Host myproj
    HostName 10.211.55.14
    User ubuntu
    Port 22
    IdentityFile ~/.ssh/dev/id_myproj
```

# Setting up ssh among servers

- The *primary* server is like your desktop machine normally. It contains the private key and it will initiate the `ssh` commands (the client)
- On the *primary* server, as the correct user, run `ssh-keygen`. When asked for a filename you can supply a custom name, e.g. `id_custom` is used below.
- If you can't use `ssh-copy-id -i id_custom.pub user@server` (because the account on the *secondary* server that you are copying to does not have a password setup) then copy the public key manually to the *secondary* server as the correct user. E.g. `cat id_custom.pub >> ~/.ssh/authorized_keys`
- Check that you can login:
  - Make sure that the *secondary* server has the IP address of the *primary* server permitted for ssh access in the security rules
  - If you used a custom name instead of the default `id_rsa` then ensure that the *primary* server has the correct key listed in `~/.ssh/config`, e.g.
    ```
    Host secondary_server_name_or_ip
      IdentityFile ~/.ssh/id_custom

    ```

# Port forwarding

See [HowToGeek](https://www.howtogeek.com/168145/how-to-use-ssh-tunneling/) for more on port forwarding, including setting up PuTTY and a SOCKS proxy.

You can set up [port forwarding](http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/#going-further) in your ssh config file

```
$ ssh -f -N -L 9906:127.0.0.1:3306 username@servername_or_ip
# -f puts ssh in background
# -N makes it not execute a remote command

```

> This will forward all local port 9906 traffic to port 3306 on the remote server, letting me point my desktop GUI to localhost (127.0.0.1:9906) and have it behave exactly as if I had exposed port 3306 on the remote server and connected directly to it.

Alternatively, setup your `~/.ssh/config` with the same information:
```
Host tunnel
    HostName servername_or_ip
    IdentityFile ~/.ssh/id_example.key
    LocalForward 9906 127.0.0.1:3306
    User username

```
`$ ssh -f -N tunnel`
