## High resolution displays

Running Visual Studio on modern laptop with a high resolution display can lead to lots of problems when `Settings` > `Display` > `Scale and Layout` is set to anything other than 100% (e.g. the default may be to scale apps up by 250% so that they do not appear tiny on the modern display).

Visual Studio runs amok over the `Designer.vb` files changing all softs of layout parameters unnecessarily and incorrectly.

Therefore I set my screen resolution a lot lower (e.g. 1280 x 800 instead of 2560 x 1600 and switch off scaling by setting it to 100%).

Windows can be confused until you log out and then log in again, but from thereon life becomes more sane again.

Sadly, Windows 10 does not seem to preserve display settings for different user accounts, so I was unable to create a user account just for Visual Studio that would have these display settings. So, thanks to these joint failures in Visual Studio and Windows 10, there is no benefit to owning a retina display. Thanks Microsoft.

(Read more about [DPI awareness](http://www.visualstudioresources.com/2017/01/13/running-visual-studio-or-setups-with-dpi-virtualization-dpi-unaware-on-high-dpi-displays/)).

## PerfWatson

[PerfWatson](https://marketplace.visualstudio.com/items?itemName=VisualStudioProductTeam.VisualStudioPerfWatson)
is installed by default in the latests versions of Visual Studio.

It sometimes causes delays when installing extensions. I perfer to
[disable it](http://stackoverflow.com/questions/42662444/how-to-disable-perfwatson2-exe-from-visual-studio-2017>)
so that it's not using up memory monitoring VS all the time.
