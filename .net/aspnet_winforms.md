**Can the ASP.NET classes be used with a legacy WinForms desktop app?**

Part of the .NET Framework is the ASP.NET Web Development Framework. Unlike C# and VB.NET,
ASP.NET is not a programming language, instead it is a collection of classes etc. to help
primarily with web apps.

Specifically, the `SqlMembershipProvider` class creates the table structure (schema) needed
to manage user profile information, including tables to store their username and password.
Then additional routines are available for creating users, authenticating details provided
etc. This is all independent of the choice of front-end.

Instead of the passwords just being stored as clear text, which is what you may end up
initially doing if you had to implement this manually yourself, the ASP.NET classes will take
care of encryption before passwords are saved to the database, thus providing the same level
of security that all modern database-driven application have.

I currently have three unknowns:
1. Can the ASP.NET classes be used with a standard VB.NET/C# desktop app.  I'm almost 100% 
certain that they can, but I've not yet confirmed it.
2. As usual, all the examples specify a Microsoft database solution as a requirement, but since
ASP.NET will work through the standard ADO.NET database interface everything should work fine
with MySQL instead.
3. Usually you would begin by creating a ASP.NET project.  We don't want to do this, but it
should be straight-forward to add the required ASP.NET modules and use them from our code.

Next step is to work through something like:
    https://docs.microsoft.com/en-us/aspnet/web-forms/overview/older-versions-security/membership/creating-the-membership-schema-in-sql-server-cs

I like this intro because it doesn't have examples that show how to make a web application,
instead it just focuses on the classes involved for managing users and their permissions.

(We should probably avoid the new open-source "ASP.NET Core" as it isn't mature yet and instead
stick with ASP.NET 4.x)
