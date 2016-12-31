Forcing Git pull to overwrite local files
=========================================

The `commands below <http://stackoverflow.com/a/10113231/1895018>`_ keep everything in the repository, but overwrite any local changes with the version from the named branch (in this case `master`).

.. code::

    git fetch origin master
    git merge -s recursive -X theirs origin/master
