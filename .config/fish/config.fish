#
# very simple
# config.fish by erine@archangels
# version 0.2.1
#
# Changelog :
# More distro support by using logic to find which package manager is being used rather than the distro name.
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
        sudo pacman -S --needed zoxide fd fzf tmux starship
    else
        echo "Current package manager is either not found or not yet supported for this command."
        echo "Add your own command into the fish configuration or just talk to Erine."
    end
end

# Configure fish function
function fishc
    # Comment/Uncomment, OR, just edit the path based on your fish configuration path
    #
    # v ~/.config/fish/
    v ~/dotfiles/.config/fish/
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
# Arch Linux
alias fuck="sudo pacman -S --needed"

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
