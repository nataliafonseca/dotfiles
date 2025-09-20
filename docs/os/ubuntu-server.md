# Ubuntu Server

## Initial requirements

```sh
sudo add-apt-repository ppa:git-core/ppa && \
sudo apt update && \
sudo apt upgrade -y && \
sudo apt install -y git build-essential curl zsh bat \
eza micro fzf imagemagick samba apt-transport-https
```

--8<-- "./docs/common/dotfiles.md"

--8<-- "./docs/common/ssh.md"

--8<-- "./docs/common/storage.md"

## Installations

```sh title="docker"
curl -fsSL https://get.docker.com | bash && \
sudo usermod -aG docker $USER && \
newgrp docker &&
```

```sh title="github cli"
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
 && sudo mkdir -p -m 755 /etc/apt/keyrings \
 && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
 && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
 && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
 && sudo mkdir -p -m 755 /etc/apt/sources.list.d \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
 && sudo apt update \
 && sudo apt install gh -y
```

```sh title="1password cli"
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
  sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
  sudo tee /etc/apt/sources.list.d/1password.list && \
  sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/ && \
  curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
  sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol && \
  sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 && \
  curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
  sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg && \
  sudo apt update && sudo apt install 1password-cli
```

node:

```sh title="node pt. 1 - installing nvm"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$(curl -fsSL https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r '.tag_name')/install.sh" | bash && \
export NVM_DIR="$HOME/.config/nvm" && \
reload # shell need to reload to see nvm and create symlinks if needed
```

```sh title="node pt. 2 - installing node"
nvm install 'lts/*' && \
nvm use 'lts/*' && \
nvm alias default 'lts/*' && \
corepack enable
```
