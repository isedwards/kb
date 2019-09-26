- [Customize Windows 10 boot logo](https://www.quora.com/How-do-I-change-windows-10-boot-screen/answer/San-Abhignu)

## Multiple desktops

- <kbd>Windows Key</kbd> + <kbd>Tab</kbd>
- <kbd>Windows Key</kbd> + <kbd>Ctrl</kbd> + <kbd>Left</kbd> / <kbd>Right</kbd>

---

### Preventing keyboard short-cuts from changing the keyboard language

I seem to hit Left Alt + Shift all the time. The result is that the keyboard language changes (if you have multiple input methods).

- Open setting <kbd>Windows Key</kbd> + <kbd>I</kbd> 
- Devices > Typing tab > Advanced Keyboard Settings (at the bottom)
- Switching Input Methods > Advanced keyboard settings - shows the Text Services and Input Languages window
- Advanced Key Settings tab > Between Input Languages > Change Key Sequences
- Change "Switch input language" and "Switch keyboard language" to "Not assigned"

Hovering over the language input icon in the tool tray give a pop up saying <kbd>Windows</kbd> + <kbd>Space</kbd> changes the language input method. This seems to still be true.

---

## Windows 10 Creators Update

A mandatory update that eats up disc space and installs some 3D paint package that I'm never going to use. It broke two things on my Windows machine - firstly VirtualBox (vital for almost all of my development work), fortunately upgrading from 5.16 to 5.1.22 fixed this with no new issues arising.

Secondly, the update silently enable Hyper-V (which I've had to disable manually in the past), it makes my computer clock slow down - not only to a lose time, but everything on the machine runs like a snail (e.g. when booting up, the spinning progress bar crawls). I disabled hyper-v again with `bcdedit /set hypervisorlaunchtype off` at an elevated command prompt.

Unfortunately a few months ago, I disposed of a monitor thinking that this was slowing the clock down as if seemed correlated with when I had the device connected.

---

## Wifi

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
