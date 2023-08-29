[How to install Parallels Tools in a Linux virtual machine](https://www.parallels.com/blogs/parallels-tools/#:~:text=How%20to%20install%20Parallels%20Tools%20in%20a%20Linux%20virtual%20machine)

```
sudo su
# menu bar > Devices > CD/DVD > Connect image…
# Navigate to /Applications/Parallels Desktop/Contents/Resources/Tools.
# Click on prl-tools-lin.iso and click Open.

mkdir /media/cdrom
mount /dev/cdrom /media/cdrom
cd /media/cdrom
./install

```
