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
    ./bzvWaybar.nix
    ./bzvRofi/bzvRofi.nix
    ./bzvKitty.nix
  ];

  options = {
    bzvDesktop.enable = mkEnableOption "Enable desktop module";
    bzvDesktop.isUbuntu = mkEnableOption "Setup hyprland for ubuntu";
  };

  config = mkIf config.bzvDesktop.enable {

    home.packages = with pkgs; [
      loupe
      wineWowPackages.waylandFull
      lutris
      socat
      networkmanagerapplet
      gnome-system-monitor
      nautilus
      slurp
      vlc
      wf-recorder
      ffmpeg
      mpv
      pwvucontrol
      blueberry
      nvtopPackages.full
      google-fonts
      libsForQt5.kolourpaint
      inkscape
      gparted
      bash
      appimagekit
      file-roller
      gnome-multi-writer
      fira-code
      fira-code-symbols
      font-awesome
      liberation_ttf
      mplus-outline-fonts.githubRelease
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      proggyfonts
    ];

    fonts = {
      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = ["Hurmit Nerd Font Mono"];
        };
      };
    };

    bzvHyprland.isUbuntu = config.bzvDesktop.isUbuntu;
    bzvHyprland.enable = true;
    bzvRofi.enable = true;
    bzvWaybar.enable = true;
    bzvKitty.enable = true;

    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };

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
        package = pkgs.nerdfonts;
        name = "IBM 3270 Nerd Font Regular";
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
