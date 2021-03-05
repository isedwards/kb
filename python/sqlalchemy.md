### Automap

`automap_base()` only maps **viable** tables which means the table [must have a primary key](https://docs.sqlalchemy.org/en/13/orm/extensions/automap.html#basic-use). It will be possible to work around this however since the ORM can map tables that have [no primary key](https://docs.sqlalchemy.org/en/14/faq/ormconfiguration.html#how-do-i-map-a-table-that-has-no-primary-key).

If you try to access an existing table that has not been mapped you get a uninformative KeyError.

```
File "~/.local/lib/python3.6/site-packages/sqlalchemy/util/_collect
ions.py", line 210, in __getattr__
    return self._data[key]
KeyError: 'observationfinal'

```
