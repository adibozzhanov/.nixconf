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
  };

  networking = {
    hostName = "aphrodite";
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
  };

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    mtr.enable = true;
    fish.enable = true;
  };

  users.users.bzv = {
    isNormalUser = true;
    shell =  pkgs.fish;
    extraGroups = [ "wheel" "input" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    wget
    emacs
    home-manager
  ];

  hardware= {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  system.stateVersion = "24.05";
}
