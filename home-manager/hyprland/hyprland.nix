{ inputs, pkgs, ... }:

{
  imports = [
    ./special_workspaces.nix
    ./appearence.nix
    ./constants.nix
    ./keybinds.nix
    ./startup.nix
    ./monitors.nix
    ./rofi.nix
    ./windowrules.nix
    ./waybar.nix
  ];

  wayland.windowManager.hyprland.enable = true;

  home.packages = with pkgs; [
    libnotify
    hyprland-protocols
    swww
    waypaper
    xdg-desktop-portal-hyprland
    hyprshot
    swaynotificationcenter
    qt5.qtwayland
    nwg-displays
    libsForQt5.polkit-kde-agent
  ];
  
  wayland.windowManager.hyprland.plugins = [

  ];
  
  wayland.windowManager.hyprland.settings = {

    input = {
      kb_layout = "us";
      follow_mouse = "1";
      sensitivity = "0"; 
      touchpad = {
        natural_scroll = "true";
      };
    };
  };
}
