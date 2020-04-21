#!/bin/bash

PACKAGES=(
  wget
  git
  jq
  python
  python-pip
  python3
  python3-pip
  flake8
  coreutils
  gcc
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

wget https://github.com/koalaman/shellcheck/releases/download/v0.7.1/shellcheck-v0.7.1.linux.x86_64.tar.xz
tar -xvf shellcheck-v0.7.1.linux.x86_64.tar.xz
cd shellcheck-v0.7.1 && mv shellcheck /usr/local/bin/ && cd ..
