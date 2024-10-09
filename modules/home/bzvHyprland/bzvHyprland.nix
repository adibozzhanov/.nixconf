{ inputs, lib, pkgs, config, ... }:
with lib;
{
  imports = [
    ./special_workspaces.nix
    ./appearence.nix
    ./constants.nix
    ./keybinds.nix
    ./startup.nix
    ./monitors.nix
    ./windowrules.nix
    ./hyprlock.nix
  ];

  options = {
    bzvHyprland.enable = mkEnableOption "Enable hyprland";
    bzvHyprland.isUbuntu = mkEnableOption "Enable ubuntu mode";
    bzvHyprland.debug = mkEnableOption "Enable debug";
  };

  config = mkIf config.bzvHyprland.enable {

    home.packages = with pkgs; [
      xorg.xrandr
      libnotify
      hyprland-protocols
      xdg-desktop-portal-hyprland
      hyprshot
      qt5.qtwayland
      kdePackages.qtwayland
      nwg-displays
      mpvpaper
      hyprpicker
      libsForQt5.polkit-kde-agent
    ] ++ (
      if !config.bzvHyprland.isUbuntu
      then [ swaynotificationcenter ]
      else []);

    wayland.windowManager.hyprland =
      let
        basePkg = if config.bzvHyprland.isUbuntu
                  then config.lib.nixGL.wrap pkgs.hyprland
                  else inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      in
      {
      systemd.variables = ["--all"];
      enable = true;
      package = basePkg.override { debug = config.bzvHyprland.debug; };

      settings = {
        debug = mkIf config.bzvHyprland.debug {
          disable_logs = "false";
        };

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
  };
}
