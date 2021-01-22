FROM codercom/code-server:3.8.0

USER root

WORKDIR /repo

COPY . .

RUN ./package.sh

RUN wget https://dl.google.com/go/go1.15.6.linux-amd64.tar.gz \
&& tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz && rm go1.15.6.linux-amd64.tar.gz

RUN rm -rf /repo

RUN set -xe \
    && apt-get update -q \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER coder

RUN echo 'eval "$(direnv hook bash)"' >> /home/coder/.bashrc

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

