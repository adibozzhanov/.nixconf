{
  wayland.windowManager.hyprland.settings = {
    misc = {
      initial_workspace_tracking = "0";
    };
    
    workspace = [
      "special:terminals, on-created-empty: kitty"
      "special:spotify, on-created-empty: spotify"
      "special:chats, on-created-empty: telegram-desktop & webcord & whatsapp-for-linux"
    ];
    
    windowrulev2 = [
      "workspace special:terminals, class:^(kitty)$"
      "workspace special:spotify, class:^(Spotify)$"      
      "workspace special:chats, class:^(org.telegram.desktop)$"
      "workspace special:chats, class:^(whatsapp-for-linux)$"
      "workspace special:chats, class:^(webcord)$"
      "worksapce special:games, class:^(gamescope)$"
    ];

    bind = [
      "CTRL, grave, togglespecialworkspace, terminals"
      "$mod, c, togglespecialworkspace, chats"
      "$mod, s, togglespecialworkspace, spotify"
    ];
  };
}
