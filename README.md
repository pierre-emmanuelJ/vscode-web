# vscode-web
VScode web in docker based on github.com/codercom/code-server for Golang programming

Image built with golang and go tools for golang programming

Run it with docker
```Shell
$ docker run \
    --name vscode \
    --rm  \
    -it \
    -p 127.0.0.1:8443:8443 \
    -v "${PWD}:/home/coder/project" \
    -v "${HOME}/.local/share/code-serve:/home/coder/.local/share/code-server" \
    pierro777/vscode:latest \
    --allow-http \
    --password password
```

To make plugin vscode configuration and plugins installation persistant:

leave this line
 - `-v "${HOME}/.local/share/code-serve:/home/coder/.local/share/code-server"`
