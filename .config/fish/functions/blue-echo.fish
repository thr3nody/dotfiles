# Use to echo a blue coloured string
function blue-echo
    echo -n -e "\e[34m$argv\e[0m"
end