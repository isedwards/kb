- Awhile ago, it looked like [tablib](http://python-tablib.org/) had been abandoned, now has a new maintainer (but who really knows?).

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

- Also note that the old `xls` format (when tablib uses `xlrd` and `xlwt`) is limited to 256 columns.
