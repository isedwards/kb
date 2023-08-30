In tmux, [the usual](https://stackoverflow.com/a/25354585) <kbd>Ctrl</kbd>+<kbd>p</kbd>, <kbd>Ctrl</kbd>+<kbd>q</kbd> may not work to detach from a container.

Oddly, <kbd>Ctrl</kbd>+<kbd>b</kbd> <kbd>:</kbd> followed by `send-keys C-p C-q` also doesn't work. In this case it should be okay to detach by
[killing the tmux window](https://github.com/isedwards/kb/blob/master/linux/tmux.md) with <kbd>Ctrl</kbd>+<kbd>b</kbd> <kbd>&</kbd>.
