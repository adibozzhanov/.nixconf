function potatomode
    hyprctl keyword animations:enabled 0
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword general:border_size 1
    hyprctl keyword decoration:rounding 0
    hyprctl keyword decoration:drop_shadow 0
    hyprctl keyword decoration:blur:enabled 0
    hyprctl keyword decoration:inactive_opacity: 1
    pkill mpvpaper
end

function normalmode
    hyprctl reload
    hyprctl keyword exec ~/.nixconf/scripts/wallpaper.sh
end

if hyprctl getoption animations:enabled | grep "1"
    potatomode
else
    normalmode
end
