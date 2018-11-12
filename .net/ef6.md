## Entity Framework

### Homepage
The actual EF Homepage (as listed on [Wikipedia](https://en.wikipedia.org/wiki/Entity_Framework)) is
http://msdn.microsoft.com/en-us/data/ef.aspx (also appears to be accessible via a
[different url](https://msdn.microsoft.com/en-us/library/aa937723%28v=vs.113%29.aspx)).

### Unresolved
Composite keys may be supported on MS SQL Server but resulted in errors when used with MySQL (the SQL that was automatically generated in these circumstances was quite odd and not supported by MySQL).

### EF6 vs EF Core
EF6 is still being developed/released, but MS are also starting from scratch writing the open source EF Core
(which will also run on Linux and Mac). EF Core is incomplete and not tried and tested...

Microsoft maintains additional [documentation on EF](https://docs.microsoft.com/en-us/ef/).
As of January 2018 the page says:

    "EF Core is a new product, and still lacks some critical O/RM features,
    EF6 will still be the most suitable choice for many applications".
    
Elsewhere they also list *[MySQL EF Core Database Provider](https://docs.microsoft.com/en-us/ef/core/providers/mysql/)*
as being in pre-release. Currently, EF6 is the prefered choice, see the EF6 tab
[here](https://docs.microsoft.com/en-us/ef/#panel=ef6x1)

    "EF 6 is a tried and tested data access technology with many years of features and stabilization"

### Entity Data Model Wizard

I use the [Entity Data Model Wizard](https://msdn.microsoft.com/en-us/library/bb399247(v=vs.110).aspx) (on Visual Studio 2015)
to genereate an .edmx file. Currently, the wizard fails in multiple places on VS2017 (when used with a MySQL database).
See [workaround]().

You can use the [Update Model Wizard](https://msdn.microsoft.com/en-us/library/cc716705(v=vs.110).aspx)
after changes are made to the underlying database (right-click the .edmx file and select Update Model from Database), but to avoid problems I tend to delete the old model, remove any related connection strings from `App.config` and then create the model anew.

### Dynamic connection strings

This [link](https://github.com/opencdms/Climsoft/commit/cc7dd606a6f59918ac7517fee91537685e1e4dcd) gives a (poor) example of altering the model to use a connection string dynamically (it works, but the model code is auto-generated, so the changes should not be made where they are).

