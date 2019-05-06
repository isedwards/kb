Django does not automatically create data migrations.

### Example #1 - Removing `null=True` from a CharField

If you attempt to remove `null=True` from a CharField where there are already NULL values in the database then you'll get an error, e.g.

    django.db.utils.OperationalError: cannot ALTER TABLE "table_name" because it has pending trigger events

This is discussed [here](https://stackoverflow.com/questions/12838111/south-cannot-alter-table-because-it-has-pending-trigger-events), and in the comments... "if you use django's migrations, see the [data migrations](https://docs.djangoproject.com/en/2.2/topics/migrations/#data-migrations) section"

    ./manage.py makemigrations --empty sites

    RunPython

### Example #2 - Converting a CharField/TextField from text to Integer

Assuming all values are either empty ('') or an integer as text (e.g. '10')...

```
from django.db import migrations, models


def text_to_integer(apps, schema_editor):
    # We can't import the model directly as it may be a newer
    # version than this migration expects. We use the historical version.
    Records = apps.get_model('app_name', 'ModelName')
    for record in Records.objects.all():
        record.new_integer_field = None if record.original_field == '' else int(record.original_field)
        record.save()


class Migration(migrations.Migration):

    dependencies = [
        ('app_name', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='ModelName',
            name='new_integer_field',
            field=models.IntegerField(blank=True, null=True),
        ),

        migrations.RunPython(text_to_integer),

        migrations.RemoveField(
            model_name='antsmodel',
            name='original_field',
        ),

        migrations.RenameField(
            model_name='antsmodel',
            old_name='new_integer_field',
            new_name='original_field',
        ),
    ]

```
- Note: at this point, the model in models.py should reflect the final model state (e.g. original_field = `IntegerField(blank=True, null=True)`). The model should make no mention of the interim field that is used in the data migration.
