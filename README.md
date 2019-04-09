# vscode-web
VScode web in docker based on https://github.com/codercom/code-server for Golang programming

Image built with golang and go tools for golang programming

Create folder to make persitant vscode config and plugins...
```
$ mkdir -p $HOME/.local/share/code-serve
```

Run it with docker
```Shell
$ docker run --name vscode \
    --rm  \
    -it \
    -p 8443:8443 \
    -v "${PWD}:/home/coder/project" \
    -v "${HOME}/.local/share/code-serve:/home/coder/.local/share/code-server" \
 #   -e "GO111MODULE=off" \ set this variable if you want to disable Go module
    -v ${GOPATH}:/home/coder/go  \
    pierro777/vscode:latest \
    --allow-http  \
    --password password
```

To make plugin vscode configuration and plugins installation persistant:

leave this line
 - `-v "${HOME}/.local/share/code-serve:/home/coder/.local/share/code-server"`
 
 ## Using web vscode
 
Edit your code using current `pwd` in `/home/coder/project` or
Browse your home directory to open a project in your go path
 
 
