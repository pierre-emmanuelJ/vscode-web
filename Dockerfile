FROM codercom/code-server:1.621

USER root

RUN apt-get install -y \
	wget

RUN wget https://dl.google.com/go/go1.12.2.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf go1.12.2.linux-amd64.tar.gz && rm go1.12.2.linux-amd64.tar.gz

USER coder

RUN echo "export GOROOT=/usr/local/bin" >> /home/coder/.bashrc
RUN mkdir /home/coder/go && echo "export GOPATH=/home/coder/go" >> /home/coder/.bashrc

RUN export PATH=$PATH:/usr/local/go/bin && \
 	echo "export PATH=$PATH:/usr/local/go/bin:/home/coder/go/bin" >> /home/coder/.bashrc && \
	PATH=$PATH:/usr/local/go/bin go get -u github.com/mdempsky/gocode \
	github.com/uudashr/gopkgs/cmd/gopkgs \
	github.com/ramya-rao-a/go-outline \
	github.com/acroca/go-symbols \
	golang.org/x/tools/cmd/guru \
	golang.org/x/tools/cmd/gorename \
	github.com/go-delve/delve/cmd/dlv \
	github.com/stamblerre/gocode \
	github.com/rogpeppe/godef \
	github.com/sqs/goreturns \
	golang.org/x/lint/golint
