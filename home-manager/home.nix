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

  gtk = {
    enable = true;

    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis-Purple";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
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
