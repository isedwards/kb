**Recommendation:** Use the same PyPI package name as the Python package name. Not only is this simplier for users to understand, it could avoid complications...

*setuptools* cannot handle a PyPI package called `opencdms` containing an importable package called `opencdms_cli` with an entry point (command line interface/script)
called `opencdms`
alongside a PyPI package called `pyopencdms` containing an importable package called `opencdms` since the later messes up the package metadata for the former.

E.g. `pip install pyopencdms` installs the `import opencdms` package and this overwrites the package metadata that was created by `pip install opencdms`
that installed `import opencdms_cli`. This results in `opencdms_cli` not being available anymore.
