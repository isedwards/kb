E.g. `exec nginx -g "daemon off;"`

When you run a process in a shell script without exec, the process will start as a child of the shell script.
This means that signals sent to the container (e.g., SIGTERM when you want to stop the container) are received
by the shell script and not by the actual process you started.

By using exec, the shell process is replaced by the process you start with exec, meaning that the started
process will now be the main process in the container (PID 1). As a result, it will receive any signals sent
to the container directly, allowing for cleaner shutdowns and better signal handling.

For nginx, when you want to gracefully stop it (e.g., to avoid dropping connections), it's essential that it
receives the SIGTERM signal correctly. If you don't use exec and simply call nginx directly, the signal will
go to the shell script, and nginx might not shut down gracefully.

So, while you can certainly run nginx without exec, using exec is recommended in this context for better
signal handling.
