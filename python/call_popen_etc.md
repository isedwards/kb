A good summary of options for calling extenal commands is [here](https://stackoverflow.com/a/92395/1624894)

- `shell=True` allows you so send any command (including pipes, redirects etc) directly to the shell for execution.
- `shell=False` (default) requires you to specify a single command name, argumets can be passed to the commands as items in a list
