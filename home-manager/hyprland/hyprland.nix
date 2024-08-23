{ pkgs, ... }:

{
  imports = [
    ./constants.nix
    ./keybinds.nix
    ./startup.nix
    ./monitors.nix
    ./rofi.nix    
  ];

  home.packages = with pkgs; [
    hyprland-protocols # this some recommended thing for other stuff...
    swww # wallpaper engine
    waypaper # wallpapers gui
    xdg-desktop-portal-hyprland # some recommended thing for video streaming
    hyprshot # screenshots
    swaynotificationcenter # notifications
    qt5.qtwayland # to be able to open qt windows
    libsForQt5.polkit-kde-agent # authentication prompt for apps that are not opened in terminal
  ];
  
  wayland.windowManager.hyprland.enable = true;
  
  wayland.windowManager.hyprland.settings = {    
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
  };
}
