# Package install function.
function fuck
    set packages $argv
    blue-echo "Starting package installation using: $package_manager\n"

    switch $package_manager
    case pacman
        yellow-echo "Doing: sudo pacman -S --needed $packages\n"
        sudo pacman -S --needed $packages
    case apt
        set dotdebfile ./*.deb
        if test "$dotdebfile" = "$packages"
            blue-echo "Installing a .deb file.\n"
            yellow-echo "Doing: sudo chmod a+r $packages\n"
            sudo chmod a+r $packages
            yellow-echo "Doing: sudo apt install $packages\n"
            sudo apt install $packages
        else
            yellow-echo "Doing: sudo apt install $packages\n"
            sudo apt install $packages
        end
    case '*'
        red-echo "Current package manager is either not found or not yet supported for this command.\n"
        red-echo "Add your own command into the fish configuration or just talk to Erine.\n"
    end
end
