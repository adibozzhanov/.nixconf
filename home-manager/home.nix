{ config, pkgs, ... }: {

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
      gtk-theme = "Nordic-darker-standard-buttons";
      icon-theme = "kora-grey-1-6-6";
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    theme = {
      package = pkgs.nordic;
      name = "Nordic-darker-standard-buttons";
    };

    iconTheme = {
      package = pkgs.kora-icon-theme;
      name = "kora-grey-1-6-6";
    };

    font = {
      package = (pkgs.nerdfonts.override { fonts = [ "Mononoki" ]; });
      name = "Mononoki Nerd Font Regular";
      size = 12;
    };

  };

  imports = [
    ./fish.nix
    ./hyprland/hyprland.nix
    ./kitty.nix
    ./git.nix
    ./packages.nix
    ./emacs.nix
  ];  
}
