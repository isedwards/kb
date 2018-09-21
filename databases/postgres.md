## Dump and restore

If you are getting errors when restoring, like `ERROR:  constraint "tbl_a_b_e1532237_fk_a_b_id" for relation "tbl" already exists` then it's possible that the [database `DROP` didn't work](https://stackoverflow.com/a/52443294/).

[pg_dump](https://www.postgresql.org/docs/9.2/static/app-pgdump.html) can create text SQL or other archive formats.

Using the other archive formats has advantages:

* smaller file sizes (custom archive format is compressed by default)
* can use [pg_restore](https://www.postgresql.org/docs/9.2/static/app-pgrestore.html) command
* regardless of pg_dump options, can change with options like `--clear --no-owner`

Attempting to use pg_restore on text sql gives the following error:

    $ pg_restore --clean --no-owner --role=new_owner -d db_name db_name.dump
    pg_restore: [archiver] input file appears to be a text format dump. Please use psql.


Therefore, when using postgres, if we need to:

* change owner information on restore
* drop objects on restore

without editing the SQL we can consider using the archive formats and pg_restore.

## List databases and owners

    psql --list

or (from within psql)

    /l

## Backing up

[Backing up](https://www.digitalocean.com/community/tutorials/how-to-backup-postgresql-databases-on-an-ubuntu-vps)

## General

- [Find duplicate records](https://stackoverflow.com/questions/28156795/how-to-find-duplicate-records-in-postgresql)
