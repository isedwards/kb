It is better to create multiple ModelForms to represent a model than to try and use a *single form* and shoehorn that form into doing different tasks.

For example, if you have a `Sites` model, creating a new site may require many fields - some of which will be required (`blank=False` in the model).

When selecting an existing site by name, you may only require the name field, but if you reuse the main form for creating a site then this form will be invalid.

The simplier forms can be created using [modelform_factory()](https://docs.djangoproject.com/en/2.0/topics/forms/modelforms/#modelform-factory-function).

Also you can create a form (that will pass validation) straight from a model instance if you know something like the `id` (prehaps from the url, or a different POST variable): `form = SiteForm(instance=Sites.objects.get(id=id)`.

---

If you have an unbounded form (with no data) then unfortunately you cannot add and error to this (and have it fail validation), e.g.

    form = MyForm()
    form.add_error({'name': 'Invalid name'})
    
This is because the `add_error` method tries to remove the data from the form's `cleaned_data` (which does not exist), and even if you add the error manually (to `form['field_name']._errors`) this doesn't get passed to `form.field_name.errors` when it is rendered in the template.

Prehaps, instead, you can create the invalid empty form you want by making it a bound form and passing in an empty request.POST...

[Changing a bound form's data](https://stackoverflow.com/questions/8241001/how-do-i-modify-the-bound-value-for-a-field-in-a-bound-form-in-django#comment59845355_8241241) (request.POST is immutable, so the bound form's data is immutable). Use request.POST.copy()

---

If you are using a copy of `request.POST` then you can change the data in a bound form:
```
form = MyForm(request.POST.copy())
form.data['person'] = person
form.data['submit_user'] = request.user.id
```

When you call `form.is_valid()` and the form is cleaned, you'll lose any data that you added that was not for a valid field. E.g. if the form defintion excludes `person` then the data you added to `form.data['person']` will be removed.
