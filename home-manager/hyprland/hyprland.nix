{ pkgs, ... }:

{
  imports = [
    ./special_workspaces.nix
    ./appearence.nix
    ./constants.nix
    ./keybinds.nix
    ./startup.nix
    ./monitors.nix
    ./rofi.nix
  ];

  wayland.windowManager.hyprland.enable = true;

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
  

  wayland.windowManager.hyprland.settings = {    

    workspace = [
      "special:terminals, on-created-empty: kitty"
      "special:chats, on-created-empty: telegram-desktop"
    ];

    windowrulev2 = [
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
