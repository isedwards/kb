- [Built-in Login system](https://web.archive.org/web/20190203145128/https://simpleisbetterthancomplex.com/tutorial/2016/06/27/how-to-use-djangos-built-in-login-system.html) needs an update since Django 1.11 changed `login` function-based view to `LoginView` class-based view and Django 2+ replaced urls.url with urls.path.

Also, the default location for login is `registration/login`.

```
from django.conf.urls import path
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('accounts/login/', auth_views.LoginView.as_view(), name='login'),
    path('accounts/logout/$', auth_views.LoginView.as_view(), name='logout'),
]
```
