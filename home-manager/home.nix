{ config, inputs, pkgs, ... }:
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
in {
  imports = [
    ./fish.nix
    ./hyprland/hyprland.nix
    ./kitty.nix
    ./git.nix
    ./packages.nix
    ./emacs/emacs.nix
    ./rofi/rofi.nix
  ];


  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "bzv";
    homeDirectory = "/home/bzv";
    file = {
      "screenshots/.keep".source = builtins.toFile "keep" "";
      "code/.keep".source = builtins.toFile "keep" "";
      "videos/.keep".source = builtins.toFile "keep" "";
      "recordings/.keep".source = builtins.toFile "keep" "";
      "wallpapers/.keep".source = builtins.toFile "keep" "";
    };

    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
      gtk.enable = true;
    };

    stateVersion = "24.05";
  };


  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = myTheme.themeName;
      icon-theme = myTheme.iconName;
      color-scheme = "prefer-dark";
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
}
