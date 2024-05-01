#
# very simple
# config.fish by erine@archangels
# version 2.3
#
# Changelog :
# Moved all of the fish functions to the fish/functions/ directory.
#

# TODO: Aliases
#
# Shell aliases for fish
alias v="nvim"
alias vh="nvim ."
alias c="code"
alias ch="code ."
alias gpu="nvidia-smi"
alias kitth="kitten theme"

# alias pokemon="pokemon-colorscripts -r"

alias sl="fd --hidden | fzf-tmux -p | xargs nvim"
alias sf="fd --hidden --type f | fzf-tmux -p | xargs nvim"
alias sd="fd --hidden --type d | fzf-tmux -p | xargs nvim"

alias q="exit"

alias uwu="sudo"

# alias minecraft="prime-run java -jar ~/lLauncher/LegacyLauncher_legacy.jar"

# TODO: Distro/OS specific aliases
#
# Arch
alias fucking="yay -S"

# TODO: Fish inits
#
# Starship Terminal Styling
starship init fish | source
# Zoxide Better <cd> Command
zoxide init fish | source

# Created by `pipx` on 2024-04-07 16:58:45
set PATH $PATH /home/erine/.local/bin
