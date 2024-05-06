function install-test
    set debfiles ./*.deb
    if count $debfiles >/dev/null
       ls $debfiles
    end
end