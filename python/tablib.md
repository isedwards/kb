- Awhile ago, it looked like [tablib](http://python-tablib.org/) had been abandoned, but it now has a new maintainer.

- At the moment, I still have to [workaround](https://github.com/vinayak-mehta/tablib/issues/252#issuecomment-454395181) some issues when writing to `xlsx`. It's worth seeing the `openpyxl` documentation, e.g. on [styles](https://openpyxl.readthedocs.io/en/stable/styles.html).

- When using Python 2.x, if you're not using unicode strings then tablib can fail with an error like: `UnicodeEncodeError: 'ascii' codec can't encode character u'\xa0' in position 20: ordinal not in range(128)`. An easy fix is to detect string data and convert it to unicode before tablib processes it:

```
    data = row['next_column']
    if isinstance(data, basestring):
        data = unicode(data)

```

- Also note that the old `xls` format is limited to 256 columns.
