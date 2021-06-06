- **ERROR:** `psycopg2` failing to install with `pip`
    > Error: pg_config executable not found.
    > 
    > If you prefer to avoid building psycopg2 from source, please install the PyPI 'psycopg2-binary' package instead.
    > For further information please check the 'doc/src/install.rst' file (also at
    >    <http://initd.org/psycopg/docs/install.html>).

    Following [the link above](https://www.psycopg.org/docs/install.html#build-prerequisites) for more details:

    > The pg_config program: it is usually installed by the libpq-dev package but sometimes it is not in a PATH directory.
    > Having it in the PATH greatly streamlines the installation, so try running pg_config --version: if it returns an error
    > or an unexpected version number then locate the directory containing the pg_config shipped with the right libpq version
    > (usually /usr/lib/postgresql/X.Y/bin/) and add it to the PATH:
    > 
    > $ export PATH=/usr/lib/postgresql/X.Y/bin/:$PATH

    Therefore:
    ```
    sudo apt update
    sudo apt install postgresql postgresql-contrib  # test again to see if installing all of Postgres can be avoided
    
    pip3 install psycopg2-binary
    # You only need pg_config to compile psycopg2, not for its regular usage.
    export PATH=/usr/lib/postgresql/X.Y/bin/:$PATH

    # unable to execute 'x86_64-linux-gnu-gcc': No such file or directory
    sudo apt-get install build-essential
    # Python.h: No such file or directory / error: libpq-fe.h: No such file or directory
    sudo apt-get install python3-dev libpq-dev
    
    pip𝟯 install psycopg2
    ```
