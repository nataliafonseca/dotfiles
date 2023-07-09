# MacOS

My initial setup guide for MacOS

## Homebrew / XCode cli stuff / Rosetta

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval $(/opt/homebrew/bin/brew shellenv)
sudo softwareupdate --install-rosetta
```

## Initial programs to make the macbook usable

```sh
brew install --cask scroll-reverser rectangle iterm2 firefox 1password 1password-cli
```

## SSH configuration

Create `$HOME/.ssh` directory if it doesn't exist

```sh
mkdir $HOME/.ssh
```

Create `id_ed25519` and `id_ed25519.pub`.

```sh
ssh-keygen -t ed25519 -C Oracle
cat ~/.ssh/id_ed25519.pub
```

(alternatively, retrieve and place in `$HOME/.ssh/`)

```sh
nano id_ed25519
nano id_ed25519.pub
```

Then setup authorized keys and allowed signers

```sh
curl -o ~/.ssh/authorized_keys --create-dirs https://github.com/nataliafonseca.keys
(echo -n '* '; cat ~/.ssh/id_ed25519.pub) > ~/.ssh/allowed_signers
sudo chown -R natalia ~/.ssh
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/authorized_keys
sudo chmod 600 ~/.ssh/allowed_signers
sudo chmod 600 ~/.ssh/id_ed25519
sudo chmod 644 ~/.ssh/id_ed25519.pub
```

Finally, add to ssh agent

```sh
eval "$(ssh-agent -s)"
ssh-add
```

## Git, github and dotfiles

```sh
brew install git gh bat exa micro
git clone https://github.com/nataliafonseca/dotfiles.git ~/.dot
echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv
exec zsh
```

## NVM and Node

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install node
corepack enable
nvm install 'lts/*'
corepack enable
nvm alias default 'lts/*'
```

## Fonts

```sh
brew tap homebrew/cask-fonts
brew install font-blex-mono-nerd-font font-jetbrains-mono-nerd-font
```

## Docker

```sh
brew install colima docker docker-compose docker-credential-helper
mkdir -p ~/.docker/cli-plugins
ln -sfn /opt/homebrew/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
colima start
```

Add colima-start to login items

## Python

```sh
brew install pipx
curl https://pyenv.run | bash
pyenv install 2
pyenv install 3
pyenv global 3 2
pipx ensurepath
curl -sSL https://install.python-poetry.org | python3 -
poetry config virtualenvs.in-project true
```

## Java

```sh
brew install openjdk
sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

## Apps - Homebrew

```sh
brew install cocoapods watchman wget imagemagick graphicsmagick mas
brew install --cask beekeeper-studio insomnia obsidian bartender cleanshot discord iina imageoptim notion qbittorrent telegram google-chrome sublime-text alt-tab
```

## AppStore Apps

Whatsapp Desktop
Affinity Designer
Affinity Photo
TextSniper
DaisyDisk
Yoink
Word
Excel
PowerPoint
Pixelmator Pro
LanguageTool
Presentify
The Unarchiver
LimeChat
NordVPN

# Configs and instructions

## Keyboard

To repeat keypresses (but disables special keys on hold):

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```

Swap `cmd` and `ctrl`:
```plain
System settings -> Keyboard -> Keyboard Shortcuts -> Modifier Keys -> (Select keyboard on top) -> ctrl > cmd / cmd > ctrl
```

Use default Function Keys:
```plain
System settings -> Keyboard -> Keyboard Shortcuts -> Function Keys -> Use F1, F2, etc. keys as standard function keys
```

### EURKey

sudo npx degit sonicdoe/EurKEY/EurKEY.bundle '/Library/Keyboard Layouts/EurKEY.bundle'

## Epson L395 Printer

https://epson.com.br/Suporte/Impressoras/Impressoras-multifuncionais/Epson-L/Epson-L395/s/SPT_C11CF46301?review-filter=macOS+13.x

## Firefox

```sh
cd /Users/natalia/Library/Application\ Support/Firefox/Profiles/*.default-release \
&& mkdir ./chrome \
&& curl https://gist.githubusercontent.com/nataliafonseca/576392293f3bc34dd125013a1b5f6dca/raw/0c670187f343bf3cc2e151a5eaa286dc2a109c0e/user.js -o ./user.js \
&& curl https://gist.githubusercontent.com/nataliafonseca/576392293f3bc34dd125013a1b5f6dca/raw/0c670187f343bf3cc2e151a5eaa286dc2a109c0e/userChrome.css -o ./chrome/userChrome.css \
&& curl https://gist.githubusercontent.com/nataliafonseca/576392293f3bc34dd125013a1b5f6dca/raw/0c670187f343bf3cc2e151a5eaa286dc2a109c0e/userContent.css -o ./chrome/userContent.css
```

In `about:config` enable `use autoscrolling`.