The shebang can fail if there are `windows line endings <http://stackoverflow.com/a/30127747/1624894>`_ in the file!

It's less obvious that this is the problem when it happens through ansible:

``stderr: /usr/bin/env: python: No such file or directory``
