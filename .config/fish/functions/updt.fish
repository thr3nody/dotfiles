# System update function
function updt
    echo "Starting a full system update."
    if test -e /usr/bin/pacman
        if test -e /usr/bin/eos-update
            echo "[eos-update] detected in the system."
            echo "Doing: eos-update --aur"
            sleep-func
            eos-update --aur
        else if test -e /usr/bin/yay
            echo "[yay] detected in the system."
            echo "Doing: yay"
            sleep-func
            yay
        else
            echo "[pacman] detected in the system."
            echo "Doing: pacman"
            sleep-func
            sudo pacman -Syu
        end
    else if test -e /usr/bin/apt
        echo "[apt] detected in the system."
        echo "Doing: sudo apt update && sudo apt upgrade"
        sleep-func
        sudo apt update && sudo apt upgrade
    else
        echo "Current package manager is either not found or not yet supported for this command."
        echo "Add your own command into the fish configuration or just talk to Erine."
    end
end
