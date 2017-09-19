## Justification for PyCharm Professional Edition

The [professional edition](https://www.jetbrains.com/pycharm/features/editions_comparison_matrix.html) has support for:
* Remote development capabilities: Remote run/debug, VM support
* Django (templates, etc.)
* Web development with JavaScript, TypeScript, HTML/CSS
* Database, SQL and UML/SQLAlchemy Diagrams (not used yet)

## Short cuts
* Alt-1, Alt-7
* Shift-Alt-z: surround with. Quickly add something around the current line, or current selection, like an if statement of a try/except.

## Settings

#### Keymap
I've changed from `Default` to `Eclipse` just to avoid Ctrl-y being mapped to yank (which deleted a line and loses your redo history). Now Ctrl-y is mapped to redo.

With the IdeaVim plugin you can also switch vim emulation on and off, returning to you base keymap when emulation is off.

#### Editor > General
**Other**
* Strip trailing spaces on Save: All
* Always keep trailing spaces on caret line: False
* Ensure line feed at end of file on Save: True
* Show quick documentation on mouse move: True

**Highlight on Caret Movement**
* Current scope

#### Editor > Code Style
* Right margin (columns): 118 (places line at the RHS of 119 chars)
