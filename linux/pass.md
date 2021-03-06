# Getting set up

1. First [create a GPG2 key](https://fedoraproject.org/wiki/Creating_GPG_Keys)

    `$ gpg2 --full-gen-key`

Make a note of the ID it returns when it reports: `You selected this USER-ID:`.

(Files are created in ~/.gnupg)

2. [Create the password store](https://www.passwordstore.org)

    ```
    $ pass init "GPG Key ID"
    $ pass git init
    ```

3. Create passwords with

    `$ pass insert path/to/password`

4. Follow the format below

    ```
    my-password
    my-username
    url-of-service.com
    Q1: Question? Answer
    Q2: Question? Answer
    ... (e.g. PIN:)
    ```

See more [here](https://git.zx2c4.com/password-store/about/)


# Distributed password store using git

Write up using on multiple machines, sharing the git repo and looking after your private key if transfering on a memory stick.
