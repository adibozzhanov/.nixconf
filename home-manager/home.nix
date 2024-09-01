{ config, pkgs, ... }: {
  
  imports = [
    ./fish.nix
    ./hyprland/hyprland.nix
    ./kitty.nix
    ./git.nix
    ./packages.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Nordic-darker-standard-buttons";
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
      package = pkgs.reversal-icon-theme;
      name = "Reversal-black";
    };

    font = {
      name = "Sans";
      size = 11;
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
}
