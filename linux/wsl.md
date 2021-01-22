- [WSL2 Installation](https://docs.microsoft.com/en-us/windows/wsl/install-win10#manual-installation-steps) ([error solved](https://github.com/microsoft/WSL/issues/4299#issuecomment-678650491))
- WSL2 doesn't currently use the standard version of docker, see [VSCode blog](https://code.visualstudio.com/blogs/2020/03/02/docker-in-wsl2) and link to [docker preview](https://docs.docker.com/docker-for-windows/wsl/)

(when I tried to install standard docker I got the error `docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?`)

<!--
Late 2018 - Windows Subsystem for Linux (WSL) still doesn't seem ready for prime time.

- Having trouble with external drives [not being mounted](https://github.com/Microsoft/WSL/issues/1131) in WSL
- Display of tmux status bar gets duplicated up the screen sometimes
- (Perhaps unsuprisingly) window's software cannot use WSL applications, e.g. "[PyCharm using WSL's git?](https://intellij-support.jetbrains.com/hc/en-us/community/posts/115000176290-Pycharm-using-WSL-s-git-)" (third-party solutions are suggested, but instead I just install [git for windows](https://github.com/Microsoft/WSL/issues/1131) locally which uses MINGW)

Setting up WSL with zsh, tmux etc: [WSL setup](https://jessicadeen.com/tech/microsoft/badass-terminal-fcu-wsl-edition-oh-my-zsh-powerlevel9k-tmux-and-more/).
-->
