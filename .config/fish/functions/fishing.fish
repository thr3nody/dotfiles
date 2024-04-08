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
