Lightsail is [billed by the hour](https://aws.amazon.com/lightsail/faq/#Billing_and_account_management).

- Send and receive up to 1 TB of data to the Internet within the month, at no extra charge (same as EC2 on-demand). Europe (London): $0.09 USD/GB

## Recipes

### NGINX

### Serving Static Content

The Bitnami NGINX image will preinstall NGINX and a database instance. However, NGINX doesn't appear to be set up [serve static content](http://nginx.org/en/docs/beginners_guide.html#static), therefore...

```
sudo mkdir /data
sudo chown bitnami /data
mkdir /data/www

vi /opt/bitnami/nginx/conf/nginx.conf
```

Within html { server { ... } }, add...

```
location / {
    root /data/www;
}
```

`nginx -s reload`
