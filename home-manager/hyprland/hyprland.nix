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

  home.packages = with pkgs; [
    libnotify
    hyprland-protocols
    xdg-desktop-portal-hyprland
    hyprshot
    swaynotificationcenter
    qt5.qtwayland
    nwg-displays
    mpvpaper
    libsForQt5.polkit-kde-agent
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    settings = {
      input = {
        kb_layout = "us";
        follow_mouse = "1";
        sensitivity = "0";
        touchpad = {
          natural_scroll = "true";
        };
      };
    };
  };
}
