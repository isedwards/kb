### <> vs !=

`<>` is ANSI-SQL. `!=` was introduced with T-SQL (Microsoft and Sybase's proprietary extension). `<>` is preferred [even by Microsoft](https://stackoverflow.com/questions/723195/should-i-use-or-for-not-equal-in-t-sql#comment53979514_723317)

### CAST vs CONVERT

```
CAST(expression AS datatype(length))
CONVERT(data_type(length), expression, style)
```
- Prefer CAST because ANSI-SQL compliant
- CONVERT accepts an optional style parameter which is used for formatting
- Therefore, use CONVERT for date and datetime, e.g. `SELECT CONVERT(VARCHAR,GETDATE(),101)` (see [style parameter](https://www.w3schools.com/sql/func_sqlserver_convert.asp))
- The meaning of the integer code used for style varies depending on the data types being converted
