Changing shell for an account that does not have a password may not be as simple as
typing `chsh` if it then asks for a password, but instead you can do it as root:

`sudo chsh -s /bin/bash username`

You can use `chsh` to [set tmux as your default shell](https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux) (where tmux then uses its `default-shell`)
