{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [      
      "suppressevent maximize, class:.*"      
      "opacity 0.9 0.8, class:^(kitty)$"
      "opacity 0.9 0.8, class:^(Spotify)$"
      "opacity 0.95 0.8, class:^(org.telegram.desktop)$"
      "opacity 1 0.8, class:^(firefox)$"
      "float, class: ^(waypaper)$"
      "float, class: ^(org.gnome.SystemMonitor)$"
      "float, class: ^(.blueman-manager-wrapped)$"
      "float, class: ^(nwg-displays)$"
      "float, class: ^(com.saivert.pwvucontrol)$"
      "idleinhibit fullscreen, class:^(*)$"
      "idleinhibit fullscreen, title:^(*)$"
      "idleinhibit fullscreen, fullscreen:1"
    ];
  };
}
