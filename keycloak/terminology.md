|                                | Keycloak   |
|--------------------------------|------------|
| Identity Provider (IdP)        | Y          |
| Policy Information Point (PIP) | Y          |
| Policy Decision Point (PDP)    | Y          |
| Policy Enforcement Point (PEP) | N ([happens on client](https://keycloak.discourse.group/t/keycloak-and-opa-integration/44#:~:text=Then%20the%20PEP%20(policy%20enforcement)%20happens%20in%20the%20client%20side))|

### [Identity provider (IdP)](https://www.nginx.com/blog/validating-oauth-2-0-access-tokens-nginx/#:~:text=identity%20provider%20(IdP))

Validation of the access token is required to ensure that it was indeed issued by a trusted identity provider (IdP) and that it has not expired.

IdPs cryptographically sign the JWTs they issue.

### [Keycloak realm](https://sairamkrish.medium.com/keycloak-integration-part-4-integration-with-nginx-based-on-docker-ba1783fa0329#:~:text=complete%20example%20configuration.-,Keycloak%20realm,-A%20realm%20manages)

A realm manages a set of users, credentials, roles, and groups. A user belongs to and logs into a realm.

Realms are isolated from one another and can only manage and authenticate the users that they control.
