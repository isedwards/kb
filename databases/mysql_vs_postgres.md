
- Although there is [some suggestion](https://kinsta.com/blog/mariadb-vs-postgresql/#size) that MariaDB has a smaller disk/memory footprint it's not born out by the container image sizes (2023): [Postgres](https://hub.docker.com/_/postgres/tags?page=1) (< 100 Mb), [MariaDB](https://hub.docker.com/_/mariadb/tags?page=1) (> 110 Mb), [MySQL](https://hub.docker.com/_/mysql/tags?page=1) (> 150 mb)
- It's clear in Django that PostgreSQL is the preferred database backend, [supporting a wider selection of capabilities]( https://docs.djangoproject.com/en/1.10/ref/contrib/postgres/)
- MySQL does not support [timezones on datetime](https://docs.djangoproject.com/en/1.10/releases/1.9/#removal-of-time-zone-aware-global-adapters-and-converters-for-datetimes)
- Another documented indication of MySQL being weaker [is here](https://docs.djangoproject.com/en/1.10/releases/1.10/#abstractuser-username-max-length-increased-to-150)
- MySQL and [partial dates](http://www.postgresql-archive.org/Partial-dates-td1849185.html#a1849191) (non-dates).
- [Amazon Aurora](https://aws.amazon.com/rds/aurora/) claims to be up to five times faster than standard MySQL databases but only three times faster than standard Postgres databases.

Headers
-------
Export data to an csv file that includes headers is [trivial in Postgres](http://stackoverflow.com/questions/1120109/export-postgres-table-to-csv-file-with-headings), and [a nightmare in MySQL](http://stackoverflow.com/questions/5941809/include-headers-when-using-select-into-outfile).
