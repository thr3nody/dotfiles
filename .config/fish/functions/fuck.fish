# Package install function
function fuck
  if test -e /usr/bin/pacman
      sudo pacman -S --needed
  else if test -e /usr/bin/apt
      sudo apt install 
  end
end