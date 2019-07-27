Awhile ago, it looked like [tablib](http://python-tablib.org/) had been abandoned, but it now has a new maintainer.

At the moment, I still have to [workaround](https://github.com/vinayak-mehta/tablib/issues/252#issuecomment-454395181) some issues when writing to `xlsx`. It's worth seeing the `openpyxl` documentation, e.g. on [styles](https://openpyxl.readthedocs.io/en/stable/styles.html).

Also note that the old `xls` format is limited to 256 columns.
