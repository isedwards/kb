## Frequently encountered errors

* [Failed to load caching_sha2_password authentication plugin](https://tableplus.com/blog/2018/07/failed-to-load-caching-sha2-password-authentication-plugin-solved.html) - MySQL 8 has changed the default authentication method. MariaDB [seem unimpressed](https://mariadb.com/kb/en/authentication-plugin-sha-256/) by the approach. The general advice, [in multiple places](https://stackoverflow.com/a/49935803/1624894) is to switch back to the old auth method. Try `SELECT * FROM mysql.user;` and `ALTER USER 'yourusername'@'localhost' IDENTIFIED WITH mysql_native_password BY 'youpassword';` (and `'yourusername'@'%'`)
* [Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement](http://stackoverflow.com/questions/31951468/error-code-1290-the-mysql-server-is-running-with-the-secure-file-priv-option/31983737#31983737)
* ERROR 1030 (HY000): Got error 28 from storage engine - disc space issue, either with the main database storage, /tmp, or insufficient space for socket file if transferring data over a network.
* [Error Code: 1118](https://stackoverflow.com/a/39403564/) - Row size too large (> 8126). Changing some columns to TEXT or BLOB may help. In current row format, BLOB prefix of 0 bytes is stored inline.

## Remote access

By default, `mysql 127.0.0.1` is [actually connecting over a socket](https://serverfault.com/a/259917), rather than through the network address. Add `-h 127.0.0.1` to force communication over TCP.

Sometimes it is useful to grant remote access of MySQL database from any IP address for development VMs that are configured with a "Host-only" IP address, this especially makes access from Windows easier instead of specifying a single IP (that can change depending on which network you are connected to, and is more immediate that setting up port forwarding).

```
# Ubuntu 20.04 Uncomplicated firewall
sudo ufw allow mysql/tcp

# mysql  Ver 8.0.21-0ubuntu0.20.04.3 for Linux on x86_64 ((Ubuntu))
mysql --version

# Find which config files mysql is reading:
/usr/sbin/mysqld --help --verbose | grep -A 1 "Default options"

# On Ubuntu 20.04 the above leads us to /etc/mysql/my.cnf with includes /etc/mysql/mysql.conf.d/ (which contains /etc/mysql/mysql.conf.d/mysqld.cnf)
#sudo vi /etc/mysql/my.cnf
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf

# comment bind-address 127.0.0.1
service mysql restart

# Latest MySQL versions finally require sudo for root account
sudo mysql -u root -p

# Starting with MySQL 8 you no longer can (implicitly) create a user using the GRANT command
# GRANT ALL PRIVILEGES ON database.* TO 'admin'@'%' IDENTIFIED BY 'newpassword';
CREATE USER 'admin'@'%' IDENTIFIED BY 'newpassword';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

ALTER USER 'admin'@'localhost' IDENTIFIED BY 'New-Password-Here';

# To ease development connections using old versions of tools like HeidiSQL switch back
# to using mysql native password. Failed with 'localhost' so changed to '%' https://stackoverflow.com/questions/49194719
ALTER USER 'admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'New-Password-Here';

```

Check that you can log in from the machine itself, but forcing the connection over IP using the VM's IP address:
```
# root fails from remote location
mysql -h 192.168.203.40 -u root -p

# new admin account suceeds. Also checking expected port (--port is ignored if connecting over sockets, but `-h IP` here ensures --port is used)
mysql -h 192.168.203.40 --port 3306 -u admin -p

```

## Summary table showing database sizes in Mb

```
SELECT table_schema "Database name", ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB" FROM information_schema.tables GROUP BY table_schema;

```


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

## Key

From the `CREATE TABLE` [manual entry](http://dev.mysql.com/doc/refman/5.1/en/create-table.html):

> `KEY` is normally a synonym for `INDEX`. The key attribute `PRIMARY KEY` can
> also be specified as just `KEY` when given in a column definition. This was
> implemented for compatibility with other database systems.

## Installation

Installation as part of a standard [LAMP](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu) stack.

```
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo mysql_install_db
sudo /usr/bin/mysql_secure_installation
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt

```

## Create database

E.g. Creating a database suitable for [Drupal](https://www.drupal.org/documentation/install/create-database)

```
 mysql -u root -p -e "CREATE DATABASE testdb CHARACTER SET utf8 COLLATE utf8_general_ci";
 mysql -u root -p

 CREATE USER testuser@localhost IDENTIFIED BY 'testpass';
 GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON testdb.* TO 'testuser'@'localhost' IDENTIFIED BY 'testpass';

 mysql -u root -p testdb < backup.sql

```

## Python-MySQL

 sudo apt-get install python-mysqldb

See [examples](http://zetcode.com/db/mysqlpython/)

```
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

```

## Direct CSV/Tab delimited output

Output to [text file](http://www.tech-recipes.com/rx/1475/save-mysql-query-results-into-a-text-or-csv-file/)
either as tab delimited
or as [csv](http://stackoverflow.com/questions/12040816/mysqldump-in-csv-format)

    SELECT * FROM users INTO OUTFILE '/tmp/users.txt';
