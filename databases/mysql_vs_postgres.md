Somewhere I have started a fairly lengthy comparison of MySQL/MariaDB and PostgreSQL (that document will eventually live here).

It's clear in Django that PostgreSQL is the preferred database backend, [supporting a wider selection of capabilities]( https://docs.djangoproject.com/en/1.10/ref/contrib/postgres/)

* MySQL does not support [timezones on datetime](https://docs.djangoproject.com/en/1.10/releases/1.9/#removal-of-time-zone-aware-global-adapters-and-converters-for-datetimes)
* Another documented indication of MySQL being weaker [is here](https://docs.djangoproject.com/en/1.10/releases/1.10/#abstractuser-username-max-length-increased-to-150)

MySQL and [partial dates](http://www.postgresql-archive.org/Partial-dates-td1849185.html#a1849191) (non-dates).

* [Amazon Aurora](https://aws.amazon.com/rds/aurora/) is up to five times faster than standard MySQL databases and three times faster than standard PostgreSQL databases.

Headers
-------
Export data to an csv file that includes headers is [trivial in Postgres](http://stackoverflow.com/questions/1120109/export-postgres-table-to-csv-file-with-headings), and [a nightmare in MySQL](http://stackoverflow.com/questions/5941809/include-headers-when-using-select-into-outfile).
