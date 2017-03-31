None is a suitable dictionary key, although be aware that it does not translate in/out of JSON correctly:

    >>> json.loads(json.dumps({None:None}))
    {u'null': None}

Avoid mutable default arguments like {} and use None instead, e.g.:

    def func(kwarg=None):
        if kwarg is None:
            kwarg = {}
            
Instead of:

    def func(kwarg={}):
        # This will result in unexpected behaviour because the mutable
        # object is create once and reused, instead of each time the
        # function is called
        pass

See https://pythonconquerstheuniverse.wordpress.com/category/python-gotchas/
