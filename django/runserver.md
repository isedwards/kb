### Request output

If runserver no longer shows the requests being made on stdout,
it's likely because of your production `LOGGING` settings in settings.py

### Ctrl-c

When a request has been made, but the response is not received, the first
`ctrl-c` sent to runserver may interupt the current execution, but not exit
runserver.  If you don't have the deafult logging output visible (see 
'Request output') then you may not see the this. The second `ctrl-c` should
not exit runserver.
