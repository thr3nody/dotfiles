# Spotify interface function
function s
    if not set -q spotify
        echo 'Spotify Interface undefined/not found.'
        echo 'Set $spotify user interface variable before using this command,'
        echo "To do that, use [set -U spotify '<spotify-ui>'] to set it up globally,"
        echo "Or use [set spotify '<spotify-ui>'] to set it up for current terminal session."
        echo 'Change the <spotify-ui> to any desired Spotify interface like spotify-launcher, spt(spotify-tui), ncspot, etc.'
    else
        echo "Using $spotify"
        sleep 1 # Time delay before executing
        $spotify
    end
end
