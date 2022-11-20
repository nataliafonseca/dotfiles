if [[ $(uname) == "Darwin" ]]; then
  export DEVICE=macbook
elif [[ $(hostnamectl hostname) == "arch" ]]; then
  export DEVICE=arch
elif [[ $(hostnamectl hostname) == "homelab" ]]; then
  export DEVICE=homelab
elif [[ $(hostnamectl hostname) == "cloud" ]]; then
  export DEVICE=cloud
fi

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.local/bin
