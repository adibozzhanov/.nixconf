{ config, inputs, pkgs, ... }:
{
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
      "code/.keep".source = builtins.toFile "keep" "";
    };
    stateVersion = "24.05";
  };
}
