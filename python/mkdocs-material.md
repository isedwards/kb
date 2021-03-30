## Changing port

`mkdocs serve -a 127.0.0.1:8001`

## 2021 build errors
```
$ . ./venv/bin/activate
$ mkdocs serve
ERROR   -  Config value: 'plugins'. Error: The "redirects" plugin is not installed
Aborted with 1 Configuration Errors!

$ grep -R redirects *
docs/deprecations.md:pip install mkdocs-redirects

$ pip install mkdocs-redirects

ERROR   -  Config value: 'plugins'. Error: The "minify" plugin is not installed
Aborted with 1 Configuration Errors!   

$ grep -R minify *

docs/changelog.md:- Reverted template minification in favor of `mkdocs-minify-plugin`

$ pip install mkdocs-minify-plugin
```
