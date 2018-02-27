## Installing

- https://github.com/jazzband/django-debug-toolbar
- https://django-debug-toolbar.readthedocs.io/

`pip install django-debug-toolbar`

## Settings file

- `DEBUG = True`
- INTERNAL_IPS to include your browser IP address, as opposed to the server address. If browsing locally this should be `INTERNAL_IPS = ('127.0.0.1',)`. If browsing remotely just specify your public address.

    **`print("IP Address for debug-toolbar: " + request.META['REMOTE_ADDR'])`**

- The debug_toolbar app to be installed i.e `INSTALLED_APPS = (..., 'debug_toolbar',)`
- The debug toolbar middleware class to be added i.e. `MIDDLEWARE_CLASSES = ('debug_toolbar.middleware.DebugToolbarMiddleware', ...)`. It should be placed as early as possible in the list.

## Template files

- Must be of type text/html
- Must have a closing </html> tag

## Static files

- If you are serving static content make sure you collect the css, js and html by doing:

    `./manage.py collectstatic`


If you cannot get the debug toolbar to show then you can [force it](https://stackoverflow.com/questions/10517765/django-debug-toolbar-not-showing-up) by adding the following to settings:

    `DEBUG_TOOLBAR_CONFIG = { 'SHOW_TOOLBAR_CALLBACK': lambda x: True }`

# Debugging DjDT

If DjDT is installed, but not showing up:
- Ensure `DEBUG=True`
- Check the IP address with `raise ValueError(request.META['REMOTE_ADDR']))`
- Last ditch, force the toolbar to show

```
def show_toolbar(request):
    return True

DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK" : show_toolbar,
}
```
