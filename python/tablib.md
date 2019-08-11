- We started using [tablib](http://python-tablib.org/) because it is used by [Django import/export](https://django-import-export.readthedocs.io/en/latest/)

- A few times it's looked like tablib has been abandoned, it now has a new maintainer ([but who really knows?](https://github.com/vinayak-mehta/tablib/issues/329#issuecomment-520212465)).

- Tablib *still* mangles data type on import and export for xlsx format. Excel dates become floats (using Excels numeric representation), whereas OpenPyXL correctly imports them as `datatime`.

  - Importing: When using Python 2.x, if you're not using unicode strings then tablib can fail with an error like: `UnicodeEncodeError: 'ascii' codec can't encode character u'\xa0' in position 20: ordinal not in range(128)`. An easy fix is to detect string data and convert it to unicode before tablib processes it:

  ```
      data = row['next_column']
      if isinstance(data, basestring):
          data = unicode(data)

  ```

  - Exporting: At the moment, I still have to [workaround](https://github.com/vinayak-mehta/tablib/issues/252#issuecomment-454395181) some issues when writing to `xlsx` due to types being written incorrectly (see also [tablib#309](https://github.com/vinayak-mehta/tablib/pull/309)). When writing, it's worth seeing the `openpyxl` documentation, e.g. on [styles](https://openpyxl.readthedocs.io/en/stable/styles.html).

  ```
  def write_xlsx(tablib_dataset, filename, sheet_name=None):
      wb = openpyxl.Workbook()
      ws = wb.active
      ws.title = sheet_name if sheet_name else "Sheet 1"

      # Write the header row and make cells bold
      ws.append(tablib_dataset.headers)
      for cell in ws[1:1]:
          cell.font = openpyxl.styles.Font(bold=True)

      for row in tablib_dataset:
          ws.append(row)

      # # Trying to add formatting for dates doesn't work because
      # # TabLib converted them to Float on import...
      # for row in ws.iter_rows():
      #     for cell in row:
      #         if isinstance(cell.value, datetime):
      #             # datetime is derived from datetime.date - in future you may wish to change to isinstance(cell, date)
      #             cell.style = DATE_STYLE

      wb.save(filename=filename)

  ```

- There are also issues with [OpenPyXl](https://openpyxl.readthedocs.io/en/stable/) and some unicode characters, e.g. [tablib#370](https://github.com/vinayak-mehta/tablib/issues/370#issuecomment-511521685).

- Also note that the old `xls` format (when tablib uses `xlrd` and `xlwt`) is limited to 256 columns.

- Unable to open a simple xlxs file on Python 3 (working in Python 2)

| Integer | String | Float | Date       |
|---------|--------|-------|------------|
|       1 | abc    |   1.2 | 10/08/2019 |

```
>>> import tablib
>>> data = tablib.Dataset().load(open('tablib_test.xlsx').read())
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.4/codecs.py", line 319, in decode
    (result, consumed) = self._buffer_decode(data, self.errors, final)
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xa0 in position 22: invalid start byte

>>> import openpyxl
>>> wb = openpyxl.load_workbook(filename = 'tablib_test.xlsx')
>>> [cell.value for cell in wb.active[2]]
[1, 'abc', 1.2, datetime.datetime(2019, 8, 10, 0, 0)]
>>>

```
