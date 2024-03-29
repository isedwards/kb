Dislikes:
- Ubuntu desktop regularly freezes after laptop sleeps
- Can't start a machine headless from the UI [without a pro licence](https://kb.parallels.com/en/123298)
- Can't set up port forwarding [without a pro licence](https://kb.parallels.com/en/124718) (which seems really petty given that there are other ways to do it, including, conveniently, in VSCode)
- Can't shutdown a suspended machine without starting it


Recommend not installing Parallels Tools for servers (just SSH in), but for Desktop it's
often not as simple as `Actions > Install Parallels Tools`, see: 
[how to install Parallels Tools in a Linux virtual machine](https://www.parallels.com/blogs/parallels-tools/#:~:text=How%20to%20install%20Parallels%20Tools%20in%20a%20Linux%20virtual%20machine)

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
