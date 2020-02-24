- To requiring login or permissions to access class based views see [here](https://exceptionshub.com/how-to-require-login-for-django-generic-views.html).

    [LoginRequiredMixin](https://docs.djangoproject.com/en/3.0/topics/auth/default/#the-loginrequired-mixin) is available in Django 1.9+. Other mixins are available in [Django braces](https://django-braces.readthedocs.io/en/latest/index.html).

    ```
    from django.contrib.auth.mixins import LoginRequiredMixin
    class IndexView(LoginRequiredMixin, generic.ListView): 
        ...

    ```

- [Class based views](https://docs.djangoproject.com/en/1.11/ref/class-based-views/#specification) docs.

    >    "Arguments passed to a view are shared between every instance of a view. This means that you shouldn’t use a list, dictionary, or any other mutable object as an argument to a view. If you do and the shared object is modified, the actions of one user visiting your view could have an effect on subsequent users visiting the same view."
    
- See https://ccbv.co.uk/

- In class based views, In the past I have customised the dispatch method. Beware, if you do this, that your custom code, that occurs before super().dispatch(), is NOT covered by any decorators, exception handling etc that is on the parent(s). See [discussion](https://stackoverflow.com/questions/27824181/django-a-class-based-view-with-mixins-and-dispatch-method)
