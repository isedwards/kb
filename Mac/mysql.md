MySQL server [will not install](https://bugs.mysql.com/bug.php?id=85020) on MacBook Pro

- "Could this be due to to Macbooks with USB-C using a different Sector Size of 4096 bytes?"
  - See [this thread](https://twocanoes.zendesk.com/hc/en-us/articles/204433039-Image-Compatibility-between-older-Macs-and-USB-C-MacBooks-MacBook-Pros)
  - and also [this one](https://bugs.mysql.com/bug.php?id=28913)

    If already installed, uninstall MySQL Server through Windows' `Add or remove programs` and restart.

    After reboot, with administrative account, delete `C:\program files\mysql` (64-bit) or `C:\program files (x86)\mysql` (32-bit)

    Go to c:\program data -> you must have hidden files view in property for access to this directory... and delete mysql directory.
    After you can start a fresh installation.

    Remeber also that when you make start windows service you must set in the property of service that it it was locally and not network service and click on integretation desktop to yes also. 

    The step are:
    Installation
    Service hang
    -> modify my.ini
    -> delete file write in the upper my post usually (c:\ProgramData\mysql\mysql server\data\*.*)
    -> modify the mysql service as (locally) and click integration with desktop or other word (not remember well)
    -> start the sercice 

See my.ini in same directory.
