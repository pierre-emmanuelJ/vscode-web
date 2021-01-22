#!/bin/bash

PACKAGES=(
  wget
  git
  jq
  python
  python-pip
  python3
  python3-pip
  openjdk-11-jdk
  flake8
  coreutils
  gcc
  rlwrap
  leiningen
  direnv
)

if [ -x "$(command -v apt-get)" ]; then
  apt-get update -y
  echo "Installing packages"
  apt-get install -y "${PACKAGES[@]}"
else
  echo "Can't install packages without apt"
  sleep 3
fi

curl -4 -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
nvm install 12.16

pip install black

SHELLCHECK_VERSION=v0.7.1
wget https://github.com/koalaman/shellcheck/releases/download/$SHELLCHECK_VERSION/shellcheck-$SHELLCHECK_VERSION.linux.x86_64.tar.xz
tar -xvf shellcheck-$SHELLCHECK_VERSION.linux.x86_64.tar.xz
cd shellcheck-$SHELLCHECK_VERSION && mv shellcheck /usr/local/bin/ && cd ..

CLJ_VERSION=1.10.1.763
curl -O https://download.clojure.org/install/linux-install-$CLJ_VERSION.sh
chmod +x linux-install-$CLJ_VERSION.sh
sudo ./linux-install-$CLJ_VERSION.sh
rm -f ./linux-install-$CLJ_VERSION.sh
