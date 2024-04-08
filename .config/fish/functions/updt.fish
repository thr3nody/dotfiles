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
