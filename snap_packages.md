Snap looks promising, but snap packages are self contained and can therefore behave in a non-standard way.
Using the `docker` snap package - the docker group doesn't exist so you cannot add yourself to that group
and avoid using `sudo`.

Also, you can't restart docker using `sudo systemctl restart docker`, instead you use `snap restart` ...
```
sudo snap install docker
sudo snap restart docker
```
