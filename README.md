# vscode-web
VScode web in docker based on https://github.com/codercom/code-server for Golang programming

Image built with golang and go tools for golang programming

Create folder to make persitant vscode config and plugins...
```
$ mkdir -p "$HOME/.local/share/code-server/extensions"
```

Run it with docker
```Shell
$ docker run \
            -d \
            --name vscode \
            --rm  \
            -it \
            -p 8080:8080 \
            -u "$(id -u):$(id -g)" \
            -v "${PWD}:/home/coder/project" \
            -v "${HOME}/.local/share/code-server:/home/coder/.local/share/code-server"  \
            -v "${HOME}/.cache/code-server:/home/coder/.cache/code-server" \
            -e ${GO111MODULE} \
	        -e "PASSWORD=${YOUR_PASSWORD}" \
            -v ${GOPATH}:/home/coder/go \
            pierro777/vscode:3.1.1
```

To make plugin vscode configuration and plugins installation persistant:

leave this line
 - `-v "${HOME}/.local/share/code-serve:/home/coder/.local/share/code-server"`
 
 ## Using web vscode
 
Edit your code using current `pwd` in `/home/coder/project` or
Browse your home directory to open a project in your go path
 
 
