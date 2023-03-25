We can set up tokens to allow write access to other repositories: [Managing access to other repositories within your codespace](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-repository-access-for-your-codespaces) (via [Multiple repositories in a codespace](https://github.com/community/community/discussions/5159))

But... we still need to clone the repositories.

#### Example

*.devcontainer/devcontainer.json
```
{
  "name": "OpenCDMS devcontainer",
  "image": "mcr.microsoft.com/devcontainers/python:0-3.11",
  "workspaceFolder": "/workspaces",

  "postCreateCommand": "/bin/bash /workspaces/opencdms/.devcontainer/postCreate.sh",

  "customizations": {
    "vscode": {
      "settings": {
        "files.exclude": {
          ".codespaces": true,
          ".vscode": true
        }
      }
    },
    "codespaces": {
      // Extra repos in addition to the repo where the .devcontainer is defined
      // https://docs.github.com/en/codespaces/managing-your-codespaces/managing-repository-access-for-your-codespaces
      "repositories": {
        "opencdms/opencdms-app": {
          "permissions": {
            "contents": "write"
          }
        },
        "opencdms/opencdms-test-data": {
          "permissions": {
            "contents": "write"
          }
        }
      }
    }
  }
}
```

*postCreate.sh*
```
# Consider running setup for the main repo that the devcontainer is defined in
# using install --editable
pip3 install -e /workspaces/opencdms

git clone https://github.com/opencdms/opencdms-app
git clone https://github.com/opencdms/opencdms-test-data

pip3 install -e /workspaces/opencdms-app
pip3 install -e /workspaces/opencdms-test-data
```
