#
# very simple
# config.fish by erine@archangels
# version 2.5
#
# Changelog :
# Refactor: Using switch-case to detect package manager.
# Add: First time unconfigured usage message prompting to do a first time configuration using the <fishing> command.
# Add: <fishing> will create universal varibale of $package_manager.
# Add: Ability to automatically detect a .deb file, make readable with chmod, then proceed with apt install.
# Add: Ability to detect eos-update for EndeavourOS users.
#

# Fish greeting here.
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
