`envsubst` is part of the GNU gettext package and is commonly used to substitute environment variables in configuration files when you start a container.

1. **E.g. nginx.conf**:

```
server {
    listen 80;
    server_name $MY_DOMAIN;
    ...
}
```

`$MY_DOMAIN` will be substituted at runtime.

2. **Dockerfile**: Copy the template file, not the actual configuration file.

```Dockerfile
FROM nginx
COPY nginx.conf.template /etc/nginx/nginx.conf.template
CMD /bin/sh -c "envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"
```

3. **Using Docker Compose with a .env file**:

Your `docker-compose.yml` might look something like this:

```yaml
version: '3'
services:
  web:
    build: .
    environment:
      - MY_DOMAIN
    ports:
      - "80:80"
```

You'll have your `.env` file in the same directory:

```
MY_DOMAIN=example.com
```

When you run `docker-compose up`, Docker Compose will automatically pick up the `.env` file, set the `MY_DOMAIN` environment variable for the container, and the CMD in the Dockerfile will ensure `envsubst` replaces the placeholder with the actual value before starting Nginx.

Note that we're taking responsibility for starting `nginx` in the fg at the end of the CMD.
