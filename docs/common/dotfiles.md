## Dotfiles and zsh

cloning dotfiles and starting zsh:

```sh
git clone https://github.com/nataliafonseca/dotfiles.git ~/.dot && \
echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv && exec zsh
```

setting zsh as default:

```sh
chsh -s $(which zsh) # might require a reboot for terminal emulators to adjust
```
