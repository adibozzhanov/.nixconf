{ pkgs, lib, config, inputs, ...}:
with lib;
let
  myTheme = {
    pkg = pkgs.orchis-theme.override {
      tweaks = [
        "black"
        "solid"
        "compact"
        "primary"
      ];
    };
    themeName = "Orchis-Teal-Dark-Compact";
    iconName = "kora-pgrey";
  };
in
{
  imports = [
    ./bzvHyprland/bzvHyprland.nix
  ];

  options = {
    bzvDesktop.enable = mkEnableOption "Enable desktop module";
  };

  config = mkIf config.bzvDesktop.enable {
    bzvHyprland.enable = true;

    home = {
      pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 20;
        gtk.enable = true;
      };
    };
    qt = {
      enable = true;
      platformTheme.name = "adwaita-dark";
    };

    gtk = {
      enable = true;
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };

      theme = {
        package = myTheme.pkg;
        name = myTheme.themeName;
      };

      iconTheme = {
        package = pkgs.kora-icon-theme;
        name = myTheme.iconName;
      };

      font = {
        package = (pkgs.nerdfonts.override { fonts = [ "Mononoki" ]; });
        name = "Mononoki Nerd Font Regular";
        size = 12;
      };
    };
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = myTheme.themeName;
        icon-theme = myTheme.iconName;
        color-scheme = "prefer-dark";
      };
    };
  };
}
