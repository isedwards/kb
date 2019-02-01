Servers should always have more than 10% of disk space remaining.

`df -h`

To investigate individual directories use: `du -h --max-depth=1`

If a lot of space is being used by `/var/cache/apt` then it may be possible to reduce this using `sudo apt-get clean`.

Another cause of low disk space can be the previous Linux kernels stored in `/usr/src/linux-*headers`.
At ~100 Mb each, it is easy for these to consume over a Gb.

Be careful not to remove the current kernel (which can be determined by using `uname -r`).

The other files can be removed using `sudo apt-get purge linux-headers-3.2.0-23`.

If you have a lot of these you could try [this all in one command](https://ubuntugenius.wordpress.com/2011/01/08/ubuntu-cleanup-how-to-remove-all-unused-linux-kernel-headers-images-and-modules/). On one server this reduced the worrying 92% disk usage to a healthy 58%.

```
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

```
