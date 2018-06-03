Instead of writing a custom test to limit access to `is_staff`, We're currently using:

```
from django.utils.decorators import method_decorator
from django.contrib.admin.views.decorators import staff_member_required

class MyView(View):
    @method_decorator(staff_member_required(login_url='/login/'))
    def dispatch(self, *args, **kwargs):
        return super(MyView, self).dispatch(*args, **kwargs)

```

In the future, we're likely to switch to using [`UserPassesTestMixin`](https://docs.djangoproject.com/en/2.0/topics/auth/default/#django.contrib.auth.mixins.UserPassesTestMixin) for all access checks.
