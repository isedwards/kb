Command line tools can be installed with `sudo apt-get install sqlite3`

```
sqlite3 filename

.help
.databases
.tables
```

[Default settings](https://stackoverflow.com/a/5924315/) can be placed in `~/.sqliterc`. Note that comments are not supported and will halt parsing.
```
.headers ON
.mode columns
```
