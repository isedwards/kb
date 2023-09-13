PostgreSQL may have a fairly small [physical memory footprint](https://www.depesz.com/2012/06/09/how-much-ram-is-postgresql-using/)

> This information below has been replicated at https://github.com/opencdms/opencdms-test-data - consider only maintaining it in one place.


For local development, I'm mostly running database servers within docker images using Docker for Windows:

- `docker pull timescale/timescaledb-postgis:latest-pg13` ([overview](https://github.com/timescale/timescaledb-docker))
- `docker pull opencdms/oracle:18.4.0-xe`
- `docker pull opencdms/mysql:5.1.73` ([overview](https://github.com/opencdms/mysql-5.1.73))
- `docker pull postgres:13` ([overview](https://hub.docker.com/_/postgres))
- `docker pull mysql:8` ([overview](https://hub.docker.com/_/mysql))

Note: Docker hub has the official mysql repository (debian) and an additional mysql-server reposority "Created, maintained and supported by the MySQL team at Oracle" (on Oracle Linux/RedHat)[⬞](https://stackoverflow.com/questions/44854843/docker-is-there-any-difference-between-the-two-mysql-docker-images).

- `docker run --name local-timescaledb -p 5432:5430 -e POSTGRES_PASSWORD=admin -d timescale/timescaledb-postgis:latest-pg12`
- `docker run --name oracle-xe -p 1521:1521 -e ORACLE_PWD=admin opencdms/oracle:18.4.0-xe`
- `docker run --name local-mysql51 -p 3307:3306 -e MYSQL_ROOT_PASSWORD=admin -d opencdms/mysql:5.1.73`
- `docker run --name local-postgres -p 5432:5432 -e POSTGRES_PASSWORD=admin -d postgres:13`
- `docker run --name local-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -d mysql:8`

Nuke option: `docker rm local-mysql`

Running commands within a container (example resets Oracle XE password):
```
docker exec -it oracle-xe bash
./setPassword.sh admin
su oracle
sqlplus  # system / admin
```
