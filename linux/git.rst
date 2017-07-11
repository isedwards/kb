Updating .gitignore
===================
After updating .gitignore you may still have files in the repository that should now be ignored.  Fix this by removing and re-adding the files thus:

.. code::

    git rm -r --cached .
    git add .

Adding executable bit
=====================
To add +x to a file that is store on a windows filesystem, use:

.. code::

    git update-index --chmod=+x filename

(often used to make django's manage.py executable)

Forcing Git pull to overwrite local files
=========================================

The `commands below <http://stackoverflow.com/a/10113231/1895018>`_ keep everything in the repository, but overwrite any local changes with the version from the named branch (in this case `master`).

.. code::

    git fetch origin master
    git merge -s recursive -X theirs origin/master

Customising
===========
* https://gist.github.com/berngp/9868043

SQL dumps
=========
GitHub advise that git is not a great tool for `SQL dumps <https://help.github.com/articles/what-is-my-disk-quota/#database-dumps>`_.  Where you decide it is appropriate, be sure to use the `--skip-extended-insert` option (`see here <https://www.viget.com/articles/backup-your-database-in-git>`_).

Large/binary files in source contol
===================================
* https://git-lfs.github.com/
* https://about.gitlab.com/2017/01/30/getting-started-with-git-lfs-tutorial/
* https://docs.gitlab.com/ee/workflow/ (LFS)
