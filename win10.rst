Windows 10 is a different animal to previous releases with Microsoft undertaking more monitoring than ever before, especially in the `Tech Preview`_.

If linux is not already your primary OS, perhaps now is the time.

---

For some odd reason, Windows 10 switches my wi-fi on and off all day long (even when not on battery...)

Power management options for wi-fi had "Allow the computer to turn off this device to save power" as default, but turning this off did not help.  Updating to the latest drivers did not help, nor did the suggestion of disabling then enabling the Wireless Network Connection, or uninstalling complete (e.g. following this `full list`_).

Currently following `this advice`_:

* Right click windows icon on task bar
* device manager
* network adaptors
* right click Intel (R) wireless
* properties 
* advanced tab
* 802.11n Channel Width for 2.4GHz selected: Change value from auto to 20 MHz Only
* (restart)

.. _Tech Preview: http://www.theregister.co.uk/2014/10/07/windows_10_data_collection/
.. _full list: http://www.howto-connect.com/fix-airplane-mode-issues-in-windows-10/
.. _this advice: https://answers.microsoft.com/en-us/windows/forum/windows_10-networking/wifi-wont-turn-on-in-windows-10/ecb56219-68ce-4613-b0ab-9338993120e9?page=~pagenum~
