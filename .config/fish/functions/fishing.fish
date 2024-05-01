# Function for downloading all requirements for this fish configuration
function fishing
    echo "Starting to download all the needed packages for current fish configuration."
    if test -e /usr/bin/pacman
        echo "[pacman] detected in the system."
        echo "Doing: sudo pacman -S --needed neovim zoxide fd fzf tmux starship"
        sleep-func
        sudo pacman -S --needed neovim zoxide fd fzf tmux starship
    else if test -e /usr/bin/apt
        echo "[apt] detected in the system."
        echo "Doing: sudo apt install neovim zoxide fd-find fzf tmux; curl -sS https://starship.rs/install.sh | sh"
        sleep-func
        sudo apt install neovim zoxide fd-find fzf tmux
        curl -sS https://starship.rs/install.sh | sh
    else
        echo "Current package manager is either not found or not yet supported for this command."
        echo "Add your own command into the fish configuration or just talk to Erine."
    end
end
