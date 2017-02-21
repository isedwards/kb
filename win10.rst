Windows 10 is a different animal to previous releases with Microsoft undertaking more monitoring than ever before, especially in the `Tech Preview`_.

If linux is not already your primary OS, perhaps now is the time.

---

For some odd reason, Windows 10 switches my wi-fi on and off all day long (even when not on battery...)

Power management options for wi-fi had "Allow the computer to turn off this device to save power" as default, but turning this off did not help.  Updating to the latest drivers did not help, nor did the suggestion of disabling then enabling the Wireless Network Connection, or uninstalling complete (e.g. following this `full list`_). Following `this advice`_ I've also changed the wireless adapter's settings from auto to 20 MHz only, also to no avail.

We've changed service provider (and therefore Wi-fi router) without any joy, and I've disabled Bluetooth and WWAN in BIOS (leaving only WLAN), but this did not help.

The problem seems to be with all WiFi devices, including USB 'dongles' and even USB pass through from a mobile phone is not being recognised.

Hardware workarounds: Currently I'm using `FoxFi`_ (with `PdaNet Client`_) to work around the WiFi issues. The client software creates the equivalent of a wired network connection and routes traffic over USB (with the phone in USB dev mode).

Another alternative may be to use a hardware USB to Ethernet converter - but this would require the phone to use it's battery (i.e. it would not be powered over USB) and also we'd need an app that can enable the internet passthrough even when a USB connection is not detected - which seems to be the case when using the converter.

.. _Tech Preview: http://www.theregister.co.uk/2014/10/07/windows_10_data_collection/
.. _full list: http://www.howto-connect.com/fix-airplane-mode-issues-in-windows-10/
.. _this advice: https://answers.microsoft.com/en-us/windows/forum/windows_10-networking/wifi-wont-turn-on-in-windows-10/ecb56219-68ce-4613-b0ab-9338993120e9?page=~pagenum~
.. _FoxFi: https://play.google.com/store/apps/details?id=com.foxfi&hl=en
.. _PdaNet client: http://pdanet.co/a/
