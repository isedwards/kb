Using [certbot on Ubuntu](https://certbot.eff.org/#ubuntuxenial-nginx)

Allow inbound traffic: HTTPS TCP 443 0.0.0.0/0

Add only the http nginx config (port 80) and let certbot update the
bottom of the config file with the https setup (it has the options to
route all http traffic over https instead).

    sudo apt-get update
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:certbot/certbot
    sudo apt-get update
    sudo apt-get install python-certbot-nginx 

    sudo certbot --nginx  # follow online prompts

HTTP has to be enabled for certbot to confirm ownership of the domain.
During the setup you can choose to redirect all http requests to https.

IMPORTANT NOTES:
 - Your certificate and chain will be saved at:
   /etc/letsencrypt/live/sub.domain.com/fullchain.pem
   Your key file will been saved at:
   /etc/letsencrypt/live/sub.domain.com/privkey.pem
- The expirary date for the certificate will be given. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"

**These days, certbot automatically adds a cron entry: `/etc/cron.d/certbot`**
