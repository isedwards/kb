## Flask-migrate

| Django                   | Flask-migrate    |
|--------------------------|------------------|
| manage.py makemigrations | flask db migrate |
| manage.py migrate        | flask db upgrade |
| manage.py migrate my_app 0000_migration_name | flask db downgrade |
| manage.py showmigrations my_app              | flask db history   |

See flask-migrate [command reference](https://flask-migrate.readthedocs.io/en/latest/#command-reference).

## Flask-sqlalchemy

Flask-SQLAlchemy has its own [event notification system](https://stackoverflow.com/a/33790196/1624894) that is rarely used. In recent versions `SQLALCHEMY_TRACK_MODIFICATIONS` is set to `False` by default, but it is good practice to set this yourself (see the link for SQLAlchemy alternative if needed).
