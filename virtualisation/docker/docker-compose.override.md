Article: [Making sense of Docker Compose overrides](https://medium.com/it-dead-inside/making-sense-of-docker-compose-overrides-efb757460d64)

The official docs linked to in the article aboe have been modified and removed the reference to `docked-compose.override.yml`. However, you can still confirm that the `override` file is automatically loaded by using `docker compose config` (to see options from the override file being used). The `docker-compose.override.yml` behaviour is also documented in the [compose CLI reference](https://docs.docker.com/compose/reference/#specifying-multiple-compose-files)
([see original SO](https://stackoverflow.com/questions/73053037/docker-compose-override-not-taking-additional-yml-into-account#comment135752478_73053258)).
