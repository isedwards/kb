Debug cron using a simple job that [runs every minute](https://askubuntu.com/a/23438/)

Edit crontab with `crontab -e`

Important: the jobs will run as the user who executed `crontab -e`. If you want to run jobs as root then you would use `sudo crontab -e`

See info on @reboot
  - https://unix.stackexchange.com/questions/109804/crontabs-reboot-only-works-for-root

Updates
=======
On Ubunutu, root receives mail when you should update, e.g. `sudo tail /var/mail/root`

```
    Date: Sun, 1 Jan 2017 06:47:02 +0000 (UTC)
    /etc/cron.weekly/update-notifier-common:
    New release '16.04.1 LTS' available.
    Run 'do-release-upgrade' to upgrade to it.
```

Errors
======

*(CRON) info (No MTA installed, discarding output)*

```
sudo apt-get install postfix
# rerun cron job
sudo tail -f /var/mail/<user>

# or, consider installing `mail` with
sudo apt-get install mailutils

```
