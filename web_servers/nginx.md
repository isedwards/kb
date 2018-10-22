## Restart

[service vs systemctl vs supervisorctl](https://askubuntu.com/a/903405)

- `nginx -s reload`
- `/etc/init.d/nginx restart`
- `/etc/init.d/nginx reload`
- `sudo systemctl restart nginx`
- `sudo systemctl reload nginx`
- `sudo systemctl status nginx`

## Test

NGINX's configtest (and when restarting the server) give no information:

    $ sudo service nginx configtest
    * Testing nginx configuration                                           [fail]
 
Instead use: `$ sudo nginx -t`

## Root vs Alias

See: https://stackoverflow.com/a/10647080/
