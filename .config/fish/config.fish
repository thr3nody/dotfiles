#
# very simple
# config.fish by erine@archangels
# version 0.2.2
#
# Changelog :
# Add support for Apt package manager when using the <fishing> command.
# Add more aliases.
# Modified <fishh> output.
#

# TODO: Fish functions
#
# Greeting function
function fish_greeting
    # Fish greeting here
end

# Spotify interface function
function s
    if not set -q spotify
        echo 'Spotify Interface undefined/not found.'
        echo 'Set $spotify user interface variable before using this command,'
        echo "To do that, use [set -U spotify '<spotify-ui>'] to set it up globally,"
        echo "Or use [set spotify '<spotify-ui>'] to set it up for current terminal session."
        echo 'Change the <spotify-ui> to any desired Spotify interface like spotify-launcher, spt(spotify-tui), ncspot, etc.'
    else
        echo "Using $spotify"
        sleep 1 # Time delay before executing
        $spotify
    end
end

# System update function
function updt
    if test -e /usr/bin/pacman
        if test -e /usr/bin/yay
            yay -Syu
        else
            sudo pacman -Syu
        end
    else if test -e /usr/bin/apt
        sudo apt update && sudo apt upgrade
    else
        echo "Current package manager is either not found or not yet supported for this command."
        echo "Add your own command into the fish configuration or just talk to Erine."
    end
end

# Function for downloading all requirements for this fish configuration
function fishing
    if test -e /usr/bin/pacman
        sudo pacman -S --needed neovim zoxide fd fzf tmux starship
    else if test -e /usr/bin/apt
        sudo apt install --no-install-recommends neovim zoxide fd fzf tmux starship
    else
        echo "Current package manager is either not found or not yet supported for this command."
        echo "Add your own command into the fish configuration or just talk to Erine."
    end
end

# Configure fish function
function fishc
    # v ~/.config/fish/
    v ~/dotfiles/..config/fish
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

alias sl="fd --hidden | fzf-tmux -p | xargs nvim"
alias sf="fd --hidden --type f | fzf-tmux -p | xargs nvim"
alias sd="fd --hidden --type d | fzf-tmux -p | xargs nvim"

alias q="exit"

alias uwu="sudo"

# alias minecraft="prime-run java -jar ~/lLauncher/LegacyLauncher_legacy.jar"

# TODO: Distro/OS specific aliases
#
# Arch
alias fuck="sudo pacman -S --needed"
alias fucking="yay -S"
# Debian
alias shit="sudo apt install --no-install-recommends"

# TODO: Documentations
#
# help-like command for this configuration
function fishh
    echo '''
fishh               --Show all Fish commands from config.fish
fishc               --Configure Fish
fishing             --Install everything needed for this fish config

v                   --NeoVim
vh                  --NeoVim in current directory
c                   --Code OSS
ch                  --Code OSS in current directory
s                   --Spotify interface
nc                  --Ncspot
gpu                 --nvidia-smi
kitth               --Kitten themes

updt                --Full system update

sl                  --Advanced search system for both files and directories.
sf                  --Advanced search system for files only.
sd                  --advanced search system for directories only.

q                   --Exit terminal

uwu                 --Alias for sudo

fuck <package>      --Pacman package install
fucking <package>   --Yay package install

shit <package>      --Apt package install
'''
end

# TODO: Fish inits
#
# Starship Terminal Styling
starship init fish | source
# Zoxide Better <cd> Command
zoxide init fish | source
