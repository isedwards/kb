## Version

On my development VMs, the following appears to be the case...

```
# Find which config files mysql is reading:
/usr/sbin/mysqld --help --verbose | grep -A 1 "Default options"

```

- Ver 14.14 Distrib 5.5.61
  - Default options are read from the following files in the given order:
    `/etc/my.cnf /etc/mysql/my.cnf /usr/etc/my.cnf ~/.my.cnf`
  - **/etc/mysql/my.cnf** has contents and changes to the file work *(after server restart)*
- Ver 14.14 Distrib 5.7.21
  - Default options are read from the following files in the given order:
    `/etc/my.cnf /etc/mysql/my.cnf ~/.my.cnf`
  - **/etc/mysql/my.cnf** just contains a link to conf directories. Changes to the file in conf directories or even overwriting `/etc/mysql/my.cnf` do not appear to make any different *(an error added to the config file is not reported on restart)*
  - Solution: `sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/my.cnf` then restart (`/etc/my.cnf` did not already exist on Ubunutu 18.04.1)


## Access

By default, `mysql 127.0.0.1` is [actually connecting over a socket](https://serverfault.com/a/259917), rather than through the network address. Add `-h 127.0.0.1` to force communication over TCP.

Sometimes it is useful to grant remote access of MySQL database from any IP address for development VMs that are configured with a "Host-only" IP address, this especially makes access from Windows easier instead of specifying a single IP (that can change depending on which network you are connected to, and is more immediate that setting up port forwarding).

```
# Find which config files mysql is reading:
/usr/sbin/mysqld --help --verbose | grep -A 1 "Default options"

sudo vi /etc/mysql/my.cnf
# comment bind-address 127.0.0.1
service mysql restart
 
GRANT ALL PRIVILEGES ON database.* TO 'admin'@'%' IDENTIFIED BY 'newpassword';
FLUSH PRIVILEGES;

```

## Key

From the `CREATE TABLE` [manual entry](http://dev.mysql.com/doc/refman/5.1/en/create-table.html):

> `KEY` is normally a synonym for `INDEX`. The key attribute `PRIMARY KEY` can
> also be specified as just `KEY` when given in a column definition. This was
> implemented for compatibility with other database systems.

## Issues

* [Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement](http://stackoverflow.com/questions/31951468/error-code-1290-the-mysql-server-is-running-with-the-secure-file-priv-option/31983737#31983737)
* ERROR 1030 (HY000): Got error 28 from storage engine - disc space issue, either with the main database storage, /tmp, or insufficient space for socket file if transferring data over a network.
* [Error Code: 1118](https://stackoverflow.com/a/39403564/) - Row size too large (> 8126). Changing some columns to TEXT or BLOB may help. In current row format, BLOB prefix of 0 bytes is stored inline.

## Installation

Installation as part of a standard [LAMP](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu) stack.

....
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo mysql_install_db
sudo /usr/bin/mysql_secure_installation
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
....

## Create database

E.g. Creating a database suitable for [Drupal](https://www.drupal.org/documentation/install/create-database)

 mysql -u root -p -e "CREATE DATABASE testdb CHARACTER SET utf8 COLLATE utf8_general_ci";
 mysql -u root -p

 CREATE USER testuser@localhost IDENTIFIED BY 'testpass';
 GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON testdb.* TO 'testuser'@'localhost' IDENTIFIED BY 'testpass';

 mysql -u root -p testdb < backup.sql

## Python-MySQL

 sudo apt-get install python-mysqldb

See [examples](http://zetcode.com/db/mysqlpython/)
....
import MySQLdb as mdb
import sys

try:
    con = mdb.connect('localhost', 'testuser', 'test623', 'testdb');
    cur = con.cursor()
    cur.execute('SELECT VERSION()')
    ver = cur.fetchone()
    print('Database version : {} '.format(ver)
    
except mdb.Error as e:
    print('Error {}: {}'.format(e.args[0],e.args[1]))
    sys.exit(1)
    
finally:    
    if con:    
        con.close()
....

## Direct CSV/Tab delimited output

Output to [text file](http://www.tech-recipes.com/rx/1475/save-mysql-query-results-into-a-text-or-csv-file/)
either as tab delimited
or as [csv](http://stackoverflow.com/questions/12040816/mysqldump-in-csv-format)

    SELECT * FROM users INTO OUTFILE '/tmp/users.txt';
