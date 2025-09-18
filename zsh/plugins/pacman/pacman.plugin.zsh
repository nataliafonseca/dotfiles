alias pacman:s="sudo pacman -S --needed"
alias pacman:sf="sudo pacman -S --needed --no-confirm"
alias pacman:syu="sudo pacman -Syu"
alias pacman:r="sudo pacman -R"

alias yay:fzf='fzfyay'
alias yay:s='yay -S --needed'
alias yay:sf="yay -S --needed --no-confirm"

# fuzzy-search AUR packages via yay, with multi-select support and a live preview showing package info and file list via bat, then installs the chosen packages.
fzfyay () {
  yay -Slq | fzf -m --preview 'bat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")' | xargs -ro  yay -S
}