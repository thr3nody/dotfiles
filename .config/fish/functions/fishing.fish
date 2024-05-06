# Function for setting up package manager variable and downloading all requirements for this fish configuration.
function fishing
    set delete-first-time-message "sed -i '3d' ~/dotfiles/.config/fish/functions/fish_greeting.fish && sed -i '/<fishing>/d' ~/.config/fish/functions/fish_greeting.fish"

    blue-echo "Looking for package manager.\n"
    if test -e /usr/bin/pacman
        yellow-echo "[pacman] detected in the system.\n"
        yellow-echo "Doing: set -U package-manager 'pacman'\n"
        set -U package-manager 'pacman'

        blue-echo "Starting to download all the needed packages for current fish configuration.\n"
        yellow-echo "Doing: sudo pacman -S --needed neovim zoxide fd fzf tmux starship\n"
        sudo pacman -S --needed neovim zoxide fd fzf tmux starship

        eval delete-first-time-message
    else if test -e /usr/bin/apt
        yellow-echo "[apt] detected in the system.\n"
        yellow-echo "Doing: set -U package-manager 'apt'\n"
        set -U package-manager 'apt'

        blue-echo "Starting to download all the needed packages for current fish configuration.\n"
        yellow-echo "Doing: sudo apt install neovim zoxide fd-find fzf tmux; curl -sS https://starship.rs/install.sh | sh\n"
        sudo apt install neovim zoxide fd-find fzf tmux
        curl -sS https://starship.rs/install.sh | sh

        eval delete-first-time-message
    else
        red-echo "Current package manager is either not found or not yet supported for this command.\n"
        red-echo "Add your own command into the fish configuration or just talk to Erine.\n"
    end
end
