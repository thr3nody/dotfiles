# Autoselect neofetch-like programs
function fetch
    if test -e /usr/bin/neofetch
        neofetch
    else if test -e /usr/bin/fastfetch
        fastfetch
    end
end
