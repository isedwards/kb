The exact behaviour of whether options override or are merged is defined in the [merge](https://docs.docker.com/compose/compose-file/13-merge/) section of the compose docs.

Article: [Making sense of Docker Compose overrides](https://medium.com/it-dead-inside/making-sense-of-docker-compose-overrides-efb757460d64)

The original docs, linked to in the article above, have been modified and removed the reference to `docked-compose.override.yml`. However, you can still confirm that the `override` file is automatically loaded by using `docker compose config` (to see options from the override file being used). The `docker-compose.override.yml` behaviour is also documented in the [compose CLI reference](https://docs.docker.com/compose/reference/#specifying-multiple-compose-files)
([see original SO](https://stackoverflow.com/questions/73053037/docker-compose-override-not-taking-additional-yml-into-account#comment135752478_73053258)).

Also, the linked docs now seem to redirect to documentation of the [`extends` keyword](https://docs.docker.com/compose/multiple-compose-files/extends/#adding-and-overriding-configuration) - which make overriding explicit.
