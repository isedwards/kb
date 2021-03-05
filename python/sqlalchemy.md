See also:
- MySQL [Frequently Encountered Errors](https://github.com/isedwards/kb/blob/master/databases/mysql.md#frequently-encountered-errors)

### Frequently encountered errors

- If you try to access an existing table that has not been mapped you get a fairly uninformative `KeyError: 'table_name'`.

### Automap and sqlacodegen

`automap_base()` only maps **viable** tables which means the table [must have a primary key](https://docs.sqlalchemy.org/en/13/orm/extensions/automap.html#basic-use). It would be possible to work around this however since the ORM can map tables that have [no primary key](https://docs.sqlalchemy.org/en/14/faq/ormconfiguration.html#how-do-i-map-a-table-that-has-no-primary-key). However, autpmap only works realtime and does not create the models in a reuable `models.py`.

[sqlacodegen](https://github.com/agronholm/sqlacodegen) works like Django's inspectdb (see [SO-QA](https://stackoverflow.com/questions/66494804/sqlalchemy-automap-classes-to-model-py-file)) and creates a `models.py` file. sqlacodegen creates Tables instead of classes where primary keys are not defined.
