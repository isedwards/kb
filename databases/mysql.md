By default, `mysql 127.0.0.1` is [actually connecting over a socket](https://serverfault.com/a/259917), rather than through the network address. Add `-h 127.0.0.1` to force communication over TCP.

== Key

From the `CREATE TABLE` [manual entry](http://dev.mysql.com/doc/refman/5.1/en/create-table.html):

> `KEY` is normally a synonym for `INDEX`. The key attribute `PRIMARY KEY` can
> also be specified as just `KEY` when given in a column definition. This was
> implemented for compatibility with other database systems.


== Issues

* [Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement](http://stackoverflow.com/questions/31951468/error-code-1290-the-mysql-server-is-running-with-the-secure-file-priv-option/31983737#31983737)
* ERROR 1030 (HY000): Got error 28 from storage engine - disc space issue, either with the main database storage, /tmp, or insufficient space for socket file if transferring data over a network.
* [Error Code: 1118](https://stackoverflow.com/a/39403564/) - Row size too large (> 8126). Changing some columns to TEXT or BLOB may help. In current row format, BLOB prefix of 0 bytes is stored inline.

== Installation

Installation as part of a standard [LAMP](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu) stack.

....
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo mysql_install_db
sudo /usr/bin/mysql_secure_installation
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
....


== Create database

E.g. Creating a database suitable for [Drupal](https://www.drupal.org/documentation/install/create-database)

 mysql -u root -p -e "CREATE DATABASE testdb CHARACTER SET utf8 COLLATE utf8_general_ci";
 mysql -u root -p

 CREATE USER testuser@localhost IDENTIFIED BY 'testpass';
 GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON testdb.* TO 'testuser'@'localhost' IDENTIFIED BY 'testpass';

 mysql -u root -p testdb < backup.sql

== Python-MySQL

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

== Direct CSV/Tab delimited output

Output to [text file](http://www.tech-recipes.com/rx/1475/save-mysql-query-results-into-a-text-or-csv-file/)
either as tab delimited
or as [csv](http://stackoverflow.com/questions/12040816/mysqldump-in-csv-format)

    SELECT * FROM users INTO OUTFILE '/tmp/users.txt';
