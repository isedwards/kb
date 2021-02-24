For local development, I'm mostly running database servers within docker images using Docker for Windows:

- `docker pull timescale/timescaledb-postgis:latest-pg12` ([overview](https://github.com/timescale/timescaledb-docker))
- `docker pull mysql:8` ([overview](https://hub.docker.com/_/mysql))

Note: Docker hub has the official mysql repository (debian) and an additional mysql-server reposority "Created, maintained and supported by the MySQL team at Oracle" (on Oracle Linux/RedHat)[⬞](https://stackoverflow.com/questions/44854843/docker-is-there-any-difference-between-the-two-mysql-docker-images).
