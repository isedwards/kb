## Wildcard certificates 

Wildcard certificates require the use of the ACMEv2 protocol and specifically the "dns-01" challenge type.
This challenge verifies domain ownership by requiring you to create a specific DNS record for your domain
and requires the use of the ACMEv2 protocol and specifically the "dns-01" challenge type.

This challenge verifies domain ownership by requiring you to create a specific DNS record for your domain.

## Certbot versions

Currently, the apt version of certbot is very old. Also it's not easy/possible to install snap in some
containers where systemd isn't installed. In these cases we can install with pip. Select pip as the install
option at https://certbot.eff.org/instructions.

```
RUN apt update -y && apt upgrade -y
RUN apt install python3 python3-pip -y
RUN pip install --upgrade pip && pip install certbot certbot
```
