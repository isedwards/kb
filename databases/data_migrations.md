
Django does not automatically create data migrations.

If you attempt to remove `null=True` from a CharField where there are already NULL values in the database then you'll get an error, e.g.

    django.db.utils.OperationalError: cannot ALTER TABLE "sites_waterbody" because it has pending trigger events
    
This is discussed [here](https://stackoverflow.com/questions/12838111/south-cannot-alter-table-because-it-has-pending-trigger-events), and in the comments...
"if you use django's migrations, see the [data migrations](docs.djangoproject.com/en/1.8/topics/migration) section"


    ./manage.py makemigrations --empty sites

    RunPython
