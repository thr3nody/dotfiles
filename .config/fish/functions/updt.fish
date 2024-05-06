# System update function
function updt
    blue-echo "Starting a full system update for: $package_manager\n"
    switch $package_manager
    case pacman
        if test -e /usr/bin/eos-update
            blue-echo "[eos-update] detected in the system.\n"
            yellow-echo "Doing: eos-update --aur\n"
            eos-update --aur
        else if test -e /usr/bin/yay
            blue-echo "[yay] detected in the system.\n"
            yellow-echo "Doing: yay\n"
            yay
        else
            yellow-echo "Doing: sudo pacman -Syu\n"
            sudo pacman -Syu
        end
    case apt
        yellow-echo "Doing: sudo apt update && sudo apt upgrade\n"
        sudo apt update && sudo apt upgrade
    case '*'
        red-echo "Current package manager is either not found or not yet supported for this command.\n"
        red-echo "Add your own command into the fish configuration or just talk to Erine.\n"
    end
end
