{ config, pkgs, ... }: {

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
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
      "wallpapers/.keep".source = builtins.toFile "keep" "";
      "screenshots/.keep".source = builtins.toFile "keep" "";
    };
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
      gtk.enable = true;
    };
    packages = with pkgs; [
      neofetch
      htop
      python3
      firefox
      telegram-desktop
      webcord
      tree
      nodejs_22
      grc
      gnome.nautilus
      nvtopPackages.full
    ];
    stateVersion = "24.05";    
  };
  programs.git = {
    enable = true;
    userName  = "Adi Bozzhanov";
    userEmail = "bozzhanov.at@gmail.com";
  };
  imports = [
    ./fish.nix
    ./hyprland/hyprland.nix
  ];
}