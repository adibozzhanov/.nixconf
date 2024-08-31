{ config, pkgs, ... }: {
  
  imports = [
    ./fish.nix
    ./hyprland/hyprland.nix
    ./kitty.nix
    ./git.nix
  ];

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
    
    packages = with pkgs; [
      gparted
      font-awesome
      obs-studio
      git-filter-repo
      git-lfs
      neofetch
      htop
      socat
      python3
      firefox
      telegram-desktop
      webcord
      tree
      nodejs_22
      grc
      whatsapp-for-linux
      gnome.gnome-system-monitor
      gnome.nautilus
      gamemode
      spotify
      slurp
      vlc
      wf-recorder
      bash
      ffmpeg
      loupe
      mpv
      gamescope
      pwvucontrol
      blueman
      nvtopPackages.full
    ];
    stateVersion = "24.05";    
  }; 
}
