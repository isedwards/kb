## Frequently encountered errors

> ORA-12514: TNS:listener does not currently know of service requested in connect descriptor

When using Express Edition, the default database name is `XE` instead of `ORCL` (else see [possible solutions here]( https://logic.edchen.org/how-to-resolve-ora-12514-tns-listener-does-not-currently-know-of-service-requested-in-connect-descriptor/))

## Tablespaces

If the `create tablespace` commands don't exist in the SQL DDL then you can do something like this:

`grep TABLESPACE ddl.sql | sort --unique > tablespaces.txt`

Convert that into a Python list of strings call `tablespaces` and then do:

```
  out = """
  CREATE TABLESPACE {0}
     DATAFILE '{0}.dbf'
     SIZE 1m
     AUTOEXTEND 20m;
  """

  for name in tablespaces:
      print out.format(name)

```

To resize a tablespace, use:

```
ALTER DATABASE
   DATAFILE 'tbs1.dbf' 
   RESIZE 10m;
```
