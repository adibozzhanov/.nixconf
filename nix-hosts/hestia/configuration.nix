{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
  };

  networking = {
    hostName = "hestia";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/London";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  services = {
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    printing.enable = true;
    libinput.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    displayManager = {
      defaultSession = "hyprland";
      sddm ={
        enable = true;
        wayland.enable = true;
        theme = "where_is_my_sddm_theme";
      };
    };
  };

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    mtr.enable = true;
    fish.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };

  users.users = {
    adi = {
      isNormalUser = true;
      shell =  pkgs.fish;
      extraGroups = [ "wheel" "input" "networkmanager" ];
    };
    bzv = {
      isNormalUser = true;
      shell =  pkgs.fish;
      extraGroups = [ "wheel" "input" "networkmanager" ];
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    emacs
    kitty
    git
    where-is-my-sddm-theme
    hyprland
    home-manager
  ];

  hardware= {
    graphics = {
      enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libkrb5
        keyutils
      ];
    };
  };

  system.stateVersion = "24.05";
}
