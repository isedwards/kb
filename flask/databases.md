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

See [Flask-SQLAlchemy documentation](https://packages.python.org/Flask-SQLAlchemy/index.html). The examples below are adapted from Miguel Grinberg's excellent Flask Mega Tutorial (recommended):
```
>>> from app import db
>>> from app.models import User, Post
>>> u = User(username='john', email='john@example.com')
>>> db.session.add(u)  # accumulate multiple changes
>>> db.session.commit()  # commit all changes atomically
```
`db.session.rollback()` can be used instead of `db.session.commit()` to abort the session and remove any changes.
```
>>> users = User.query.all()
>>> users
[<User john>]
>>> for u in users:
...     print(u.id, u.username)
...
1 john
>> u = User.query.get(1)
>>> p = Post(body='my first post!', author=u)  # where author was defined by db.relationship() in the User class
>>> db.session.add(p)
>>> db.session.commit()
>>> 
>>> for p in Post.query.all():
...     print(p.id, p.author.username, p.body)
...
>>> User.query.order_by(User.username.desc()).all()
```
In this final part, it's not clear whether there is also a way to delete all `users` without looping
```
>>> users = User.query.all()
>>> for u in users:
...     db.session.delete(u)
...
>>> posts = Post.query.all()
>>> for p in posts:
...     db.session.delete(p)
...
>>> db.session.commit()
```
