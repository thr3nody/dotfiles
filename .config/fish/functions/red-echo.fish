# Use to echo a red coloured string
function red-echo
  echo -n -e "\e[31m$argv\e[0m"
end