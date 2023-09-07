`microdnf`, `dnf`, and even `rpm` are not installed in the minimal (RHEL 8) container due to security hardening measures, which reduce the attack surface.

During development it can be useful to have basic tools like `ps`. See the [docs](https://www.keycloak.org/server/containers) to details on mounting an additional container to add `dnf`.
