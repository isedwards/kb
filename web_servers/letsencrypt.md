Using [certbot on Ubuntu](https://certbot.eff.org/#ubuntuxenial-nginx)

Allow inbound traffic: HTTPS TCP 443 0.0.0.0/0

Add only the http nginx config and let certbot update the bottom of the config file with the https setup (it has the options to route all http traffic over https instead).

    sudo apt-get update
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:certbot/certbot
    sudo apt-get update
    sudo apt-get install python-certbot-nginx 

    sudo certbot --nginx  # follow online prompts
