
"Arguments passed to a view are shared between every instance of a view. This means that you shouldn’t use a list, dictionary, or any other mutable object as an argument to a view. If you do and the shared object is modified, the actions of one user visiting your view could have an effect on subsequent users visiting the same view."
    
[Class based views](https://docs.djangoproject.com/en/1.11/ref/class-based-views/#specification) docs.
