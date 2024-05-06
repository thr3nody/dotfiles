# Package install function.
function fuck
    set packages $argv
    echo "Starting package installation."

    if test -e /usr/bin/pacman
        echo "[pacman] detected in the system."
        echo "Doing: sudo pacman -S --needed $packages"
        sudo pacman -S --needed $packages
    else if test -e /usr/bin/apt
        set dotdebfile ./*.deb
        if test "$dotdebsfiles" = "$packages"
            echo "[apt] detected in the system."
            echo "Installing a .deb file."
            echo "Doing: sudo chmod a+r $packages"
            sudo chmod a+r $packages
            echo "Doing: sudo apt install $packages"
            sudo apt install $packages
        else
            echo "[apt] detected in the system."
            echo "Doing: sudo apt install $packages"
            sudo apt install $packages
        end
    else
        echo "Current package manager is either not found or not yet supported for this command."
        echo "Add your own command into the fish configuration or just talk to Erine."
    end
end
