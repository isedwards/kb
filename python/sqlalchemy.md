See also: MySQL [Frequently Encountered Errors](https://github.com/isedwards/kb/blob/master/databases/mysql.md#frequently-encountered-errors)

### SQLAlchemy 2.0 planning

#### Currently stuck with 1.3.x

SQLAlchemy 1.4.x is preparing for verion 2.0 release that [will change the SQLAlchemy API](https://docs.sqlalchemy.org/en/14/tutorial/#a-note-on-the-future). Ideally we would use v1.4.x which would allow us to use the latest version 2.0-style API whilst our dependencies (like `flask-sqlacodegen`) would continue to use the depreciated API as long as they need to. However, unfortunately the latest version of `sqlacodegen` currently only supports SQLAlchemy 0.8.x - 1.3.x.

`flask-sqlacodegen` is based on an older fork of `sqlacodegen` v1.1.6 and has `SQLAlchemy==1.3.17` in [requirements.txt](https://github.com/ksindi/flask-sqlacodegen/blob/68fd69a56ed6922dd2a95d0d36bda3501edbd229/requirements.txt#L20) (and SQLAlchemy >= 0.6.0 in [setup.py](https://github.com/ksindi/flask-sqlacodegen/blob/68fd69a56ed6922dd2a95d0d36bda3501edbd229/setup.py)). Installing with `pip` I currently get `sqlalchemy.__version__ == 1.3.23`.

Keep an eye on `flask-sqlacodegen` (and `sqlacodegen`) releases for a version bump that would allow us to switch to 1.4.x.

### SQLAlchemy frequently encountered errors

- If you try to access an existing table that has not been mapped you get a fairly uninformative `KeyError: 'table_name'`.

### Automap and sqlacodegen

`automap_base()` only maps **viable** tables which means the table [must have a primary key](https://docs.sqlalchemy.org/en/13/orm/extensions/automap.html#basic-use). It would be possible to work around this however since the ORM can map tables that have [no primary key](https://docs.sqlalchemy.org/en/14/faq/ormconfiguration.html#how-do-i-map-a-table-that-has-no-primary-key). However, autpmap only works realtime and does not create the models in a reuable `models.py`.

[sqlacodegen](https://github.com/agronholm/sqlacodegen) works like Django's inspectdb (see [SO-QA](https://stackoverflow.com/questions/66494804/sqlalchemy-automap-classes-to-model-py-file)) and creates a `models.py` file. sqlacodegen creates Tables instead of classes where primary keys are not defined.
