{
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
      # various
      ", Print, exec, hyprshot -m region -o ~/screenshots"
      "$mod SHIFT, W, exec, waypaper"
      "$mod, R, exec, $scriptsDir/screen-record.sh"
      "$mod, T, exec, $terminal"
      "$mod SHIFT, period, exec, emacs ~/.nixconf"
      "$mod, SPACE, exec, rofi -show drun"
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
    ];
  };
}
