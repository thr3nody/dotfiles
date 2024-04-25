# Autoselect neofetch-like programs
function fetch
    if test -e /usr/bin/neofetch
        if test -e /usr/bin/fastfetch
            fastfetch
        else
            neofetch
        end
    end
end
