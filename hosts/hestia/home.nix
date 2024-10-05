{ config, inputs, pkgs, ... }:
{
  imports = [
    ./packages.nix
  ];

  bzvDesktop.enable = true;
  bzvEmacs.enable = true;
  bzvGit.enable = true;
  bzvFish = {
    enable = true;
    withAliases = true;
  };

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
    stateVersion = "24.05";
  };
}
