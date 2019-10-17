### Automap

`automap_base()` only maps **viable** tables which means the table [must have a primary key](https://docs.sqlalchemy.org/en/13/orm/extensions/automap.html#basic-use).

If you try to access an existing table that has not been mapped you get a uninformative KeyError.

```
File "~/.local/lib/python3.6/site-packages/sqlalchemy/util/_collect
ions.py", line 210, in __getattr__
    return self._data[key]
KeyError: 'observationfinal'

```
