# Setting up ssh among servers

- On the *primary* server, as the correct user, run `ssh-keygen`. The example below allows you to supply a custom name, e.g. `id_custom`
- If you can't use `ssh-copy-id` (because the account on the server that you are copying to does not have a password setup) then copy the public key manually to the *secondary* server as the correct user. E.g. `cat id_custom.pub >> ~/.ssh/authorized_keys`
- Check that you can login:
  - Make sure that the *secondary* server has the IP address of the *primary* server permitted for ssh access in the security rules
  - If you used a custom name instead of the default `id_rsa` then ensure that the *primary* server has the correct key listed in `~/.ssh/config`, e.g.
    ```
    Host secondary_server_name_or_IP
      IdentityFile ~/.ssh/id_custom

    ```

# Port forwarding

You can set up [port forwarding](http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/#going-further) in your ssh config file
