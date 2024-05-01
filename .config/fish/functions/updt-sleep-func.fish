# Sleep function for <updt> command. Default is 2.5 second or equivalently 0.5 second per dot.
function updt-sleep-func
    for i in (seq 1 5)
        echo -n ". "
        sleep 0.5
    end
end
