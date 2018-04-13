### That port is already in use

If runserver won't start because a process is already using the port, you can
find/kill the other process. See [options](https://stackoverflow.com/questions/20239232/error-that-port-is-already-in-use).

### Request output

If runserver no longer shows the requests being made on stdout,
it's likely because your production `LOGGING` settings in settings.py
no longer have `console` as an option for logging. See the following
for [enabling more error output](https://stackoverflow.com/a/23818289/1624894).

### Ctrl-c

When a request has been made, but the response is not received, the first
`ctrl-c` sent to runserver may interupt the current execution, but not exit
runserver.  If you don't have the default logging output visible (see 
'Request output') then you may not see the this. The second `ctrl-c` should
not exit runserver.
