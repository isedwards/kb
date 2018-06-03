Instead of writing a custom test to limit access to `is_staff`, I'm currently using:

```
from django.utils.decorators import method_decorator
from django.contrib.admin.views.decorators import staff_member_required

class MyView(View):
    @method_decorator(staff_member_required(login_url='/login/'))
    def dispatch(self, *args, **kwargs):
        return super(MyView, self).dispatch(*args, **kwargs)

```
