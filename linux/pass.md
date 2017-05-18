1. First create a GPG2 key

    `$ gpg2 --full-gen-key`

Make a note of the ID it returns when it reports: `You selected this USER-ID:`.

(Files are created in ~/.gnupg)

2. Create the password store

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
