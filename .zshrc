source $HOME/.zsh/partials/env.zsh
source $HOME/.zsh/partials/p10k.zsh

source $HOME/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/zsh-z/zsh-z.plugin.zsh

source $HOME/.zsh/partials/zsh.zsh
source $HOME/.zsh/partials/aliases.zsh
source $HOME/.zsh/partials/nvm.zsh
source $HOME/.zsh/partials/docker.zsh

if [[ $DEVICE == "macbook" ]]; then
  source $HOME/.zsh/partials/homebrew.zsh
  source $HOME/.zsh/partials/android.zsh
  source $HOME/.zsh/partials/p10k.mac.zsh

elif [[ $DEVICE == "arch" ]]; then
  source $HOME/.zsh/partials/p10k.arch.zsh

elif [[ $DEVICE == "fedora" ]]; then
  source $HOME/.zsh/partials/p10k.fedora.zsh

elif [[ $DEVICE == "homelab" ]]; then
  source $HOME/.zsh/partials/p10k.homelab.zsh

elif [[ $DEVICE == "cloud" ]]; then
  source $HOME/.zsh/partials/p10k.cloud.zsh
fi