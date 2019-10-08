The `System.Data.SQLite` in NuGet package manager that has the most downloads doesn't do anything for me (version 3.13.0 at the time of writting).

If you follow the NuGet link from the [offical page](https://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki) 
the List of Release Packages shows the latest version number is actually 1.0.111, 

`System.Data.SQLite 1.0.111` works, but it includes support for Linq and EF6 and as such adds extra dependencies. Therefore found `System.Data.SQLite.Core`
