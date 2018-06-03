### Tmux

* Create new session from within tmux: `:new` (use <kbd>Ctrl</kbd><kbd>b</kbd>+<kbd>$</kbd> to rename, and <kbd>s</kbd> to list)
* Create new window <kbd>Ctrl</kbd><kbd>b</kbd>+<kbd>c</kbd> (use <kbd>Ctrl</kbd><kbd>b</kbd>+<kbd>,</kbd> to rename, and <kbd>w</kbd> to list)
* [tmux cheetsheet](http://www.dayid.org/comp/tm.html)
* tmux freezes then you press <kbd>ctrl</kbd><kbd>s</kbd>, you can unfreeze with <kbd>ctrl</kbd><kbd>q</kbd>
* <kbd>ctrl</kbd><kbd>b</kbd> + <kbd>&</kbd> to destroy a stuck window
* [Simple tmux configuration](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/)
* Detach a client <kbd>CTRL</kbd>-<kbd>B</kbd> + <kbd>SHIFT</kbd>-<kbd>D</kbd>. Especially useful when an old connection is causing the screen to display the wrong size (with `.` in the empty space).

tmux will list all sessions with their current dimension. Then you simply detach from all the smaller sized sessions.

Look into [saving and restoring sessions](https://superuser.com/questions/440015/restore-tmux-session-after-reboot)
