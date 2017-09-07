Handling static and media files
===============================
**THIS DOCUMENT IS NOT YET COMPLETE**

[Basic docs](https://stackoverflow.com/a/40330875/), [more advanced docs](https://docs.djangoproject.com/en/dev/ref/contrib/staticfiles/).

- See also: [summary](https://stackoverflow.com/a/6418281/)
- TODO: Consider paths for serving private static files (see [XSendfile](https://github.com/isedwards/kb/blob/master/web_servers/XSendfile_(X-Accel-Redirect).md))

`The STATICFILES_DIRS setting should not contain the STATIC_ROOT setting` - this is because collectstatic collects the files into `STATIC_ROOT` and then NGiИX serves these. `STATIC_ROOT` appears to only be used by collectstatic, the setting [is not used in production](https://stackoverflow.com/a/40330875/)

Conventions
-----------
    ─ {{ STATIC_ROOT }}
      ├─ app1
      ├─ app2
      ├─ myapp

In Production
-------------
In production static files are served by NGiИX, it makes no use of the
[staticfiles app](https://docs.djangoproject.com/en/dev/ref/contrib/staticfiles/)
other than use of the staticfiles'
[`collectstatic`](https://docs.djangoproject.com/en/dev/ref/contrib/staticfiles/#collectstatic)
management command to copy static files that are included with an apps.

By convention (since each app uses static/app_name) `collectstatic` copies files
[into subdirectories with each app's name](https://djangobook.com/serving-files-production/#leanpub-auto-serving-the-admin-files),
e.g. files from `django/contrib/admin/static/admin` are copied to `STATIC_ROOT/admin`.
NGiИX is then configured to serve `STATIC_ROOT` at `STATIC_URL`.

In development
--------------
In development it is useful to use runserver because the server is restarted each time you make a change
and you can be more guarenteed of see the current state of the development.
Runserver controls its port, therefore to serve static files from the same domain/port the staticfiles app
is necessary to assist runserver in finding the files.

