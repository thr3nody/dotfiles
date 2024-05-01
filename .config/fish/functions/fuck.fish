# Package install function.
function fuck
    set packages $argv
    echo "Starting package installation."

    if test -e /usr/bin/pacman
        echo "[pacman] detected in the system."
        echo "Doing: sudo pacman -S --needed $packages"
        sleep-func
        sudo pacman -S --needed $packages
    else if test -e /usr/bin/apt
        echo "[apt] detected in the system."
        echo "Doing: sudo apt install $packages"
        sleep-func
        sudo apt install $packages
    else
        echo "Current package manager is either not found or not yet supported for this command."
        echo "Add your own command into the fish configuration or just talk to Erine."
    end
end
