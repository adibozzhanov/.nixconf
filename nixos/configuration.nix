# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./steam.nix
    ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  programs.hyprland.enable = true;
  
  networking.hostName = "hestia";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "where_is_my_sddm_theme";
  
  nix.settings.experimental-features = ["nix-command" "flakes"];
  services.printing.enable = true;
  nixpkgs.config.allowUnfree = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;
  programs.fish.enable = true;
  users.users.bzv = {
    isNormalUser = true;
    shell =  pkgs.fish;
    extraGroups = [ "wheel" "input" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    wget
    emacs
    kitty
    hyprland
    where-is-my-sddm-theme
    home-manager
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;    
  };
  
  system.stateVersion = "24.05";
}

