- [Class based views](https://docs.djangoproject.com/en/1.11/ref/class-based-views/#specification) docs.

>    "Arguments passed to a view are shared between every instance of a view. This means that you shouldn’t use a list, dictionary, or any other mutable object as an argument to a view. If you do and the shared object is modified, the actions of one user visiting your view could have an effect on subsequent users visiting the same view."
    
- See https://ccbv.co.uk/

- In class based views, I almost always customise the dispatch method. Beware, if you do this, that your custom code, that occurs before super().dispatch(), is NOT covered by any decorators, exception handling etc that is on the parent(s).
