Updating `/etc/nginx/nginx.conf` to display upstream info of most recent subrequest in access log.
Changes have to be in the outter `http {}` block hence the modification to the main `nginx.conf` file.

In cases where there are multiple subrequests (e.g. first using `auth_request` for permission
then a second `proxy_pass` to a containerised service) only the most recent subrequest is logged.
To get details of the earlier subrequest you have to store info in headers and
[track with variables](https://stackoverflow.com/questions/60718439/nginx-why-no-access-log-for-rediect-location#comment107493296_60738429)
(not currently shown below).

```sh
#    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
#                      '$status $body_bytes_sent "$http_referer" '
#                      '"$http_user_agent" "$http_x_forwarded_for"';

    log_format main '[$time_local] $remote_addr - $remote_user $status '
                            '"$request" $body_bytes_sent "$http_referer" '
                            '"$http_user_agent" "$http_x_forwarded_for" '
                            'upstream_response_time=$upstream_response_time '
                            'upstream_addr=$upstream_addr '
                            'upstream_status=$upstream_status';
```
