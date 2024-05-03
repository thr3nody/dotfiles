# Use to echo a yellow coloured string
function yellow-echo
    echo -n -e "\e[33m$argv\e[0m"
end