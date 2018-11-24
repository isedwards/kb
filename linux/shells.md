Changing shell for an account that does not have a password may not be as simple as
typing `chsh` if it then asks for a password, but instead you can do it as root:

`sudo chsh -s /bin/bash username`
