# vscode-web
VScode web in docker based on https://github.com/codercom/code-server for Golang programming.

Image built with golang and go tools for golang programming.

## Prerequisite
Create folder to make persitant vscode config and plugins...etc.
```
$ mkdir -p "$HOME/.local/share/code-server/extensions"
```

## Run with docker

Export `VSCODE_PASSWORD` env variable to setup your password.

```
export VSCODE_PASSWORD=example_password
```

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
            -e "PASSWORD=${VSCODE_PASSWORD}" \
            -v ${GOPATH}:/home/coder/go \
            pierro777/vscode:3.1.1
```

To make plugin vscode configuration and plugins installation persistant:

Leave this line.
 - `-v "${HOME}/.local/share/code-serve:/home/coder/.local/share/code-server"`
 
## With traefik (optional)

Create a traefik container inside a network (in a docker-compose for example).

Add those lines in the docker run cmds:

Add your domain name e.g(example.com).
Add the traefik network name e.g(traefik_default).
```
--label traefik.frontend.rule=Host:example.com
--label traefik.enable=true
--network traefik_default
```

Example:
```Shell
docker run \
            -d \
            --name vscode \
            -it \
            --rm \
            -u "$(id -u):$(id -g)" \
            --label traefik.frontend.rule=Host:${YOUR_DOMAIN_NAME}  \
            --label traefik.enable=true \
            --network traefik_default \
            -v "${PWD}:/home/coder/project" \
            -v "${HOME}/.local/share/code-server:/home/coder/.local/share/code-server"  \
            -v "${HOME}/.cache/code-server:/home/coder/.cache/code-server" \
            -e ${GO111MODULE} \
            -e "PASSWORD=${VSCODE_PASSWORD}" \
            -v ${GOPATH}:/home/coder/go \
            pierro777/vscode:3.1.1
```

 
## Using web vscode
 
Edit your code using current `pwd` in `/home/coder/project` or
browse your home directory to open a project in your go path.
 
 
