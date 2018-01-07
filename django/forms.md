It is better to create multiple ModelForms to represent a model than to try and use a single form and shoehorn it into doing multiple tasks.

If, for example, you have a `site` model. Creating a new site may require many fields, some of which will be required (`blank=False` in the model).

When selecting an existing site by name, you may only require the name field, but if you reuse the form for creating a site then this form will be invalid.

The simplier forms can be created using [modelform_factory()](https://docs.djangoproject.com/en/2.0/topics/forms/modelforms/#modelform-factory-function).
