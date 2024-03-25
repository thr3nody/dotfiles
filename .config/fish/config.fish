#
# very simple
# config.fish by erine@archangels
# version 0.1.7
#
# Changelog :
# Added aliases for <neofetch> for easier image backend usage. Configure the one I marked as  NOTE:
#

if status is-interactive
    # Commands to run in interactive sessions can go here
    # WARNING: No no no don't do anything here (yet(?)):D
end

# Greeting function
function fish_greeting
    # Fish greetin ghere
end

# Random function
function hi
    figlet Hello
end

# warp-cli use case functions
function warp-start
    echo 'Starting Warp Daemon'
    # WARNING: SUDO command below
    sudo systemctl start warp-svc
    echo 'Proceed with <warp-conn> to connect to Warp.'
end

function warp-conn
    echo 'Connecting to Warp: '
    warp-cli connect
    warp-cli status

end

function warp-exit
    echo 'Disconnecting from Warp: '
    warp-cli disconnect
end

# Spotify interface function
function s
    if not set -q spotify
        echo 'Spotify Interface undefined/not found.'
        echo 'Set $spotify user interface variable before using this command,'
        echo "To do that, use [set -U spotify '<spotify-ui>'] to set it up globally,"
        echo "Or use [set -U spotify '<spotify-ui>'] to set it up for current terminal session."
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
    end
end


# Aliases
alias d="dolphin"
alias v="nvim"
alias vh="nvim ."
alias c="code"
alias ch="code ."
alias gpu="nvidia-smi"
alias kitth="kitten theme"
alias pokemon="pokemon-colorscripts -r"

#
# NOTE: Comment/Uncomment for Neofetch with custom img and sources, modify as needed.
# As for me, I like it to automatically clear the terminal as well so.
# For the <fetch> one, I think maybe because the use of [chafa] and img backend, it will automatically clears the terminal.
# Any fix for that please come to me.
#
# alias neofetch="neofetch --ascii --source ~/.config/neofetch/rose.txt"
alias fetch="neofetch --chafa --size 285px --source ~/Pictures/4Chan/Evangelion/lonelyBig.jpg"

alias sl="fd --hidden | fzf-tmux -p | xargs nvim"
alias sf="fd --hidden --type f | fzf-tmux -p | xargs nvim"
alias sd="fd --hidden --type d | fzf-tmux -p | xargs nvim"

alias q="exit"

alias pacclr="sudo pacman -Sc"
alias pacclr-full="sudo pacman -Scc"
alias yayclr="yay -Sc"
alias yayclr-full="yay -Scc"

alias fuck="sudo pacman -S"
alias uwu="sudo"

alias minecraft="prime-run java -jar ~/lLauncher/LegacyLauncher_legacy.jar"

# Fish functions
function fishc
    cd ~/.config/fish/
    vh
end

# TODO: All documentations go here
function fishh
    echo '''
fishh               --Show all Fish commands from config.fish
fishc               --Configure Fish

d                   --Dolphin
v                   --NeoVim
vh                  --NeoVim in current directory
c                   --Code OSS
ch                  --Code OSS in current directory
s                   --Spotify interface.
nc                  --Ncspot
gpu                 --nvidia-smi
kitth               --Kitten themes
pekemon             --Summon random pokemon

fetch               --Neofetch with custom img-backend
neofetch            --Neofetch with custom ascii art

sl                  --Advanced search system for both files and directories.
sf                  --Advanced search system for files only.
sd                  --advanced search system for directories only.

q                   --Exit terminal

updt                --Full system update

pacclr              --Pacman packages and caches cleanup
pacclr-full         --Aggresive Pacman packages and caches cleanup
yayclr              --Yay packages and caches cleanup
yayclr-full         --Aggresive Yay packages and caches cleanup

warp-start          --Start walp-cli daemon, use <warp-conn>
                      to connect to Warp after daemon started
warp-conn           --Connect to Warp
warp-exit           --Disconnect from Warp

minecraft           --Shortcut for using nvidia <prime-run> to run minecraft launcher.

fuck <package_name> --Pacman package install
uwu                 --Alias for sudo
'''
end

# Starship Terminal Styling
starship init fish | source
# Zoxide Better <cd> Command
zoxide init fish | source
