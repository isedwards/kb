# Makemigrations and migrate failing when trying to remove fields from model

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
also referenced in the forms - and that prevents Django initialising.
