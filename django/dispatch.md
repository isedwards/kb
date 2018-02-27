In class based views, I almost always customise the dispatch method.

Beware, if you do this, that your custom code, that occurs before super().dispatch(), is NOT covered by any decorators, exception handling etc that is on the parent(s).
