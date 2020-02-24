### manage.py migrate fails to create table(s)

If you `makemigrations` with `managed = False` set in a model's metadata (e.g. because this is the default when using `inspectdb`),
then the table(s) will not be created in the database.  Changing `managed` to `True` and running `makemigrations` and `migrate` may
still not create the required table(s).

If this happens, roll make the migrations, ensure that `managed = True` and run `makemigrations` and `migrate` again. E.g.:

```
# Removing all of an app's migrations from the `django_migrations` table:
./manage.py migrate --fake metadata zero

# or ... rollback to migration number 0005
./manage.py migrate --fake metadata 0005

```

### manage.py migrate hangs

If `./manage.py makemigrations --dry-run` is hanging (even when there are no new changes) the problem may be that there are active transactions. This happened to me after interupting a large data migration using <kbd>Ctrl</kbd><kbd>c</kbd>. You can restart postgres with `sudo /etc/init.d/postgresql restart` and MySQL with `sudo /etc/init.d/mysql restart`.

Alternatively, there could be a problem like limted disc space or memory.


### Makemigrations and migrate failing when trying to remove fields from model

```
    class Record(BootstrapModelForm):
  File "/apps/project/local/env/local/lib/python2.7/site-packages/django/forms/models.py", line 272, in __new__
    raise FieldError(message)
django.core.exceptions.FieldError: Unknown field(s) (field_a, field_b) specified for Record

```

Solution:

When I saw that the error in the trackback was also occuring in runserver as
well as makemigrations/migrate I realised that this was a Django initialise
issue (not related to the model fields).

The issue was that the fields cannot just be removed from the model, they are
also referenced in the forms - and that prevents Django from initialising.
