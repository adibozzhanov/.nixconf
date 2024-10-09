{ config, ...}:{
  wayland.windowManager.hyprland.settings = {

    gestures = {
      workspace_swipe = "false";
    };

    bindm = [
      # mouse
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bind = [
      # rofi
      "$mod SHIFT, C, exec, pkill rofi || rofi -show calc -modi calc -no-show-match -no-sort"

      # wallpaper controls
      "$mod SHIFT, right, exec, echo 'playlist-next' | socat - /tmp/mpv-socket"
      "$mod SHIFT, left, exec, echo 'playlist-prev' | socat - /tmp/mpv-socket"
      "$mod SHIFT, down, exec, echo 'cycle pause' | socat - /tmp/mpv-socket"
      "$mod SHIFT, up, exec, pkill mpvpaper || ~/.nixconf/scripts/wallpaper.sh"

      "ALT, TAB, cyclenext"

      "$mod SHIFT, G, exec, fish ~/.nixconf/scripts/potatomode.fish"

      # various
      ", Print, exec, hyprshot -m region -o ~/screenshots"
      "$mod, R, exec, $scriptsDir/screen-record.sh"
      "$mod, T, exec, $terminal"
      "$mod SHIFT, X, exec, hyprpicker"
      "$mod SHIFT, P, exec, pkill rofi || rofi -show p -modi p:'rofi-power-menu --no-symbols --choices shutdown/reboot'"
      "$mod SHIFT, comma, exec, emacsclient -c"
      "$mod SHIFT, period, exec, emacsclient -c ~/.nixconf"
      "$mod, SPACE, exec, pkill rofi || rofi -show drun"
      "$mod, Q, killactive"
      "$mod SHIFT, F, togglefloating"
      "$mod SHIFT, B, exec, pkill waybar && waybar"
      ", F11, fullscreen"

      "$mod CTRL, B, movewindow, l"
      "$mod CTRL, F, movewindow, r"
      "$mod CTRL, P, movewindow, u"
      "$mod CTRL, N, movewindow, d"

      # navigation
      "$mod, B, movefocus, l"
      "$mod, F, movefocus, r"
      "$mod, P, movefocus, u"
      "$mod, N, movefocus, d"

      # workspace bindings
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
    ] ++ (
      if config.bzvHyprland.isUbuntu
      then ["$mod SHIFT, L, exec, swaylock -i ~/Pictures/wallpapers/wpp.png"]
      else ["$mod SHIFT, L, exec, hyprlock --immediate"]
    );
  };
}
