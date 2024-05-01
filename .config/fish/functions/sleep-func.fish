# Sleep function. Default is 2.5 second or equivalently 0.5 second per dot.
function sleep-func
    for i in (seq 1 5)
        echo -n ". "
        sleep 0.5
    end
    echo
end
