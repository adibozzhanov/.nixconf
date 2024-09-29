# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./steam.nix
      ./amd.nix
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
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    printing.enable = true;
    libinput.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    displayManager = {
      sddm ={
        enable = true;
        wayland.enable = true;
        theme = "where_is_my_sddm_theme";
      };
    };
  };

  programs = {
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

  users.users.bzv = {
    isNormalUser = true;
    shell =  pkgs.fish;
    extraGroups = [ "wheel" "input" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    wget
    emacs
    kitty
    where-is-my-sddm-theme
    hyprland
    home-manager
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  system.stateVersion = "24.05";
}
