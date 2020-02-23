## inspectdb failed with MySQL

**error:**
```
query = query.decode(errors='replace')
AttributeError: 'str' object has no attribute 'decode'

```

**workaround:**

Temporarily edit django source to comment the line
```
python3
import django

print(os.path.join(os.path.dirname(django.__file__), 'db', 'backends', 'mysql', 'operations.py'))

```

## The SECRET_KEY setting must not be empty

This can be caused by Django not being able to process the settings file.

If you're using an non-standard settings file location then this must be specified in wsgi.py AND also either in the
DJANGO_SETTINGS_MODULE environment variable, or passed as an argument to each invocation of `manage.py`, e.g.

  - `manage.py runserver --settings=myproject.settings.local`
  - `manage.py migrate --settings=myproject.settings.local`
  
Also ensure that `myproject.settings.production` is importable from `manage.py shell`.


## Looping over all records

This just crashes `Killed`, or worse, hangs without explanation...

    for instance in Model.objects.all():
        instance.field = update_field()
        instance.save()
        
(obviously you don't want to be changing isntance.id)

Here's one possible workaround...

    from django.db.models import Max
  
    max_id = Model.objects.all().aggregate(Max('id'))['id__max']

    for current_id in range(1, max_id + 1):  # assuming id begins at 1
        try:
            instance = Model.objects.get(id=current_id)
        except Model.DoesNotExist:
            print current_id, '(does not exist)'
        else:
            print 'Processing id', current_id
            instance.field = update_field()
            instance.save()
