#
# very simple
# config.fish by erine@archangels
# version 0.2.0
#
# Changelog :
# Better support for Debian based Distro with distro detection logic.
# Added a function to download and install all requirements for this fish configuration.
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
        sleep 1
        $spotify
    end
end

# System update function
function updt
    if cat /etc/os-release | grep ID="arch" -q
        sudo pacman -Syu
    else if cat /etc/os-release | grep ID="ubuntu" -q
        sudo apt update && sudo apt upgrade
    else
        echo "Current OS/Linux Distro is not yet supported for this command."
        echo "Add your own command into the fish configuration or just talk to Erine."
    end
end

# Function for downloading all requirements for this fish configuration
function fishing
    if cat /etc/os-release | grep ID="arch" -q
        sudo pacman -S --needed zoxide fd fzf tmux starship
    else
        echo "Current OS/Linux Distro is not yet supported for this command."
        echo "Add your own command into the fish configuration or just talk to Erine."
    end
end

# Configure fish function
function fishc
    # Comment/Uncomment, OR, just edit the path based on your fish configuration path
    # v ~/.config/fish/
    v ~/dotfiles/.config/fish/
end

# TODO: Aliases
#
# Shell aliases for fish
alias d="dolphin"
alias v="nvim"
alias vh="nvim ."
alias c="code"
alias ch="code ."
alias gpu="nvidia-smi"
alias kitth="kitten theme"

# alias pokemon="pokemon-colorscripts -r"
# alias neofetch="neofetch --ascii --source ~/.config/neofetch/rose.txt"
# alias fetch="neofetch --chafa --size 285px --source ~/Pictures/4Chan/Evangelion/lonelyBig.jpg"

alias sl="fd --hidden | fzf-tmux -p | xargs nvim"
alias sf="fd --hidden --type f | fzf-tmux -p | xargs nvim"
alias sd="fd --hidden --type d | fzf-tmux -p | xargs nvim"

alias q="exit"

alias uwu="sudo"

# alias minecraft="prime-run java -jar ~/lLauncher/LegacyLauncher_legacy.jar"

# Arch Based aliases
alias pacclr="sudo pacman -Sc"
alias pacclr-full="sudo pacman -Scc"

alias yayclr="yay -Sc"
alias yayclr-full="yay -Scc"

alias fuck="sudo pacman -S --needed"

# TODO: Documentations
#
# help-like command for this configuration
function fishh
    echo '''
fishh               --Show all Fish commands from config.fish
fishc               --Configure Fish
fishing             --Install everything that is needed for this fish config

d                   --Dolphin
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

pacclr              --Pacman packages and caches cleanup
pacclr-full         --Aggresive Pacman packages and caches cleanup

yayclr              --Yay packages and caches cleanup
yayclr-full         --Aggresive Yay packages and caches cleanup

fuck <package_name> --Pacman package install
'''
end

# TODO: Fish inits
#
# Starship Terminal Styling
starship init fish | source
# Zoxide Better <cd> Command
zoxide init fish | source
