{pkgs, ...}:{
  imports = [
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    hyprland-protocols
    swww
    waypaper
    xdg-desktop-portal-hyprland
    hyprkeys
    hyprshot
    swaynotificationcenter
    qt5.qtwayland
    libsForQt5.polkit-kde-agent
    pamixer
  ];
  
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";

    exec-once = [
      "waypaper --restore"
      "swaync"
      "systemctl --user start plasma-polkit-agent"
    ];
    
    monitor = ",preferred,auto-left,auto";

    general = {
      gaps_in = "5";
      gaps_out = "5";
      border_size = "2";
      "col.active_border" = "rgba(ffffffff)";
      "col.inactive_border" = "rgba(595959aa)";
      resize_on_border = "true";
      layout = "dwindle";
    };

    decoration = {
      rounding = "10";
      active_opacity = "1.0";
      inactive_opacity = "1.0";
      drop_shadow = "true";
      shadow_range = "4";
      shadow_render_power = "3";
      "col.shadow" = "rgba(1a1a1aee)";     
      blur = {
        enabled = "true";
        size = "3";
        passes = "1";
        vibrancy = "0.1696";
      };
    };

    animations = {
      enabled = "true";
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "workspaces, 1, 6, default"
        "fade, 1, 7, default"
        "borderangle, 1, 8, default"
        "border, 1, 10, default"
        "windowsOut, 1, 7, default, popin 80%"
      ];
    };

    dwindle = {
      pseudotile = "true";
      preserve_split = "true";
    };

    misc = { 
      force_default_wallpaper = "1";
      disable_hyprland_logo = "true";
    };

    workspace = [
      "special:terminals, on-created-empty: kitty"
      "special:chats, on-created-empty: telegram-desktop"
    ];

    windowrulev2 = [
      "workspace special:terminals, class:^(kitty)$"
      "workspace special:chats, class:^(org.telegram.desktop)$"
      "suppressevent maximize, class:.*"
    ];

    input = {
      kb_layout = "us";
      follow_mouse = "1";
      sensitivity = "0"; 
      touchpad = {
        natural_scroll = "false";
      };
    };

    gestures = {
      workspace_swipe = "false";
    };


    bindm = [
      # mouse
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    
    bind =
      [
        # various
        ", Print, exec, hyprshot -m region -o ~/screenshots"
        "$mod SHIFT, W, exec, waypaper"        
        "$mod, T, exec, $terminal"
        "$mod, SPACE, exec, rofi -show drun"
        "$mod, Q, killactive"
        "$mod SHIFT, F, togglefloating"

        "$mod CTRL, B, movewindow, l"
        "$mod CTRL, F, movewindow, r"
        "$mod CTRL, P, movewindow, u"
        "$mod CTRL, N, movewindow, d        "

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
        "CTRL, grave, togglespecialworkspace, terminals"
        "$mod, c, togglespecialworkspace, chats"
      ];
  };
}
