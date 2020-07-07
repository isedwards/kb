## Future

Virtualbox may decline due to lack of [investment by Oracle](https://developers.slashdot.org/story/15/01/30/1530245/virtualbox-development-at-a-standstill). It may soon be time to jump ship and consider investing in VMWare Workstation (PC), VMWare Fusion (mac) or Parallels (mac). [Vagrant recommend VMWare](https://www.vagrantup.com/vmware/index.html).

I'm [stuck on VirtualBox 5.0](https://www.virtualbox.org/ticket/14383#comment:5) (see [old downloads](https://www.virtualbox.org/wiki/Download_Old_Builds_5_0)), later versions cause my machine to freeze. Since I can't run VBox 6+ I'm unable to use Hyper-V and VirtualBox side-by-side using Microsoft's Virtual Machine Platform to allow VBox to access VT-x.

##  Symlinks

Trying to create a symlink in linux on a mounted windows drive fails with an error message saying that the location is read-only. However, Windows 7+ [supports symlinks](https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/) - if you instead create them in windows using a command prompt with elevated privileges and use the `mklink /D` command (does this work - I seem to be having trouble with recursive links: `ls: cannot open directory .: Too many levels of symbolic links`), after removing the windows symlink and creating a directory with the same name both `git status` and `grep` failed on that directory due to some nonprintable character sending a kill signal (seems more than coincidence). `git status | strings` should prevent the kill by only printing printable strings, but for me this outputed nothing.

## Vagrant

[Arguments for vagrant](https://superuser.com/a/588334/638595), but in general I use VirtualBox snapshots and ansible as I don't need to bring up whole networks of new VMs all at once.

## Setup

* General > Advanced: Shared Clipboard Bidirectional

### VirtualBox preferences
- Network: Host-only Networks - "vboxnet0" or "VirtualBox Host-Only Ethernet Adapter"
  - IPv4 Address: 192.168.56.1
  - IPv4 Network Mask: 255.255.255.0
  - DHCP Server: Disabled

### Virtual machine settings - Network
- Adapter 1: NAT
- Adapter 2: Host-only Adapter (vboxnet0)

### Operating System setup
When installing Ubunut 16.04 it asks which is the primary network interface: enp0s3 or enp0s8. Note that it not longer uses eth0, eth1 etc. Select enp0s3 as the primary interface, and use enp0s8 to set up the static IP address below

- Configure temporary static IP address (don't use): `ifconfig enp0s8 192.168.56.101 netmask 255.255.255.0 up`
- Permanent config for static IP address (/etc/network/interfaces)

```
# The host-only network interface
auto enp0s8
iface enp0s8 inet static
address 192.168.56.101
netmask 255.255.255.0
network 192.168.56.0
broadcast 192.168.56.255
```

### Setup hosts file (/etc/hosts, C:\Windows\System32\drivers\etc) - on host!
```
192.168.56.101    myserver1
192.168.56.102    myserver2
```

### Guest Additions

Devices > Install Guest Additions
```
sudo apt-get update
sudo apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)
mkdir /media/cdrom
sudo mount /dev/cdrom /media/cdrom
sudo /media/cdrom/VBoxLinuxAdditions.run
# sudo reboot now

```
If you are installing a server image, before the final step of running `VBoxLinuxAdditions.run`, either:

 * Install xserver (you can then use a tool like https://sourceforge.net/projects/xming/[Xming] (XLaunch) with http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html[PuTTY]): `sudo apt-get install xserver-xorg`
 * Run the final step without X11 support:
   `sudo /media/cdrom/VBoxLinuxAdditions.run --nox11`

To copy and paste into the console running in the VirtualBox window you may want to install GPM.

*Update*: Unfortunately the GPM clipboard does not sync with the X11 clipboard, so copy and paste still does not work. One of the solutions here may work: http://superuser.com/questions/451039

## Shared folders

Attempting to access the shared folders will give the error `Permission denied`
```
sudo adduser your_username vboxsf
# sudo reboot now
```

### Cannot create symbolic links in shared folder

"The host operating system must support symlinks (i.e. a Mac, Linux or Solaris host is required)"

For possible workarounds see: https://github.com/mitchellh/vagrant/issues/713


## Errors

[VT-x/AMD-V hardware acceleration is not available on your system](http://superuser.com/a/768845)

VT-x/AMD-V support gets disabled for VirtualBox if you have Hyper-V installed. In the past Hyper-V has been enabled by Windows updates, it is also used for 'containers', Windows sandbox, WSL2 etc. Disable Hyper-V via Windows Features or from an elevated command prompt by typing:

`dism.exe /Online /Disable-Feature:Microsoft-Hyper-V`


## Networking (futher notes)

`sudo apt-get install openssh-server`

When creating a virtual machine, the network adapter used seems to correspond to whether you are using Wi-fi or cable at that time. If you later switch then you can get network errors at boot time and have to manually reconfigure network settings. Also, if you setup VMs on your laptop and then connect to a different network you don't necessarily want them to be visible on the network.

**Solution:** http://christophermaier.name/2010/09/01/host-only-networking-with-virtualbox/
 
 E.g. LOCAL VM won't run on wi-fi: "a start job is running for raise network interfaces" - Adding a second network adapter (wi-fi card with a different MAC address) prevents the error and allows boot - but because this card is not set up in the OS I don't get an IP address. https://ubuntuforums.org/showthread.php?t=2323253

* Host-Only: The VM will be assigned one IP, but it's only accessible by the box VM is running on. No other computers can access it.
* NAT: Just like your home network with a wireless router, the VM will be assigned in a separate subnet, like 192.168.6.1 is your host computer, and VM is 192.168.6.3, then your VM can access outside network like your host, but no outside access to your VM directly, it's protected.
* Bridged: Your VM will be in the same network as your host, if your host IP is 172.16.120.45 then your VM will be like 172.16.120.50. It can be accessed by all computers in your host network.

[More info](http://www.virtualbox.org/manual/ch06.html#networkingmodes)...

If you get the error "no NAT Network name is currently specified" then you have to create a NAT Network in the main VirtualBox application first (File > Preferences > Network (NAT Networks) > Add New NAT Network).

**Next:** If you want other users on the network to be able to access one of your private VMs how would you set up port forwarding? 
