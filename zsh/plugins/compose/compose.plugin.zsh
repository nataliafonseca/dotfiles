0=${(%):-%x}
fpath+=(${0:A:h}/completions)

autoload -Uz compinit
compinit -d ~/.cache/zsh/compdump