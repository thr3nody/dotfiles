#
# very simple
# config.fish by erine@archangels
# version 2.4
#
# Changelog :
# Less dry code with more function.
# More support currently focused on Debian (apt) based distro.
# Improved functions like fuck, fishing, and updt, with it's distro-detect automation.
# Better in-terminal message transparency, especially when using distro-detect automation.
#

# Fish reeting here.
function fish_greeting
  # UwU
  blue-echo "You are using Erine's fish configuration. Please do the <fishing> command for first-time-configuration.\n"
end

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

# TODO: Add support for more linux distribution.
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
