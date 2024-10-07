{ config, inputs, pkgs, ... }:
{

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
    username = "adi";
    homeDirectory = "/home/adi";
    file = {
      "code/.keep".source = builtins.toFile "keep" "";
    };
    stateVersion = "24.05";
  };
}
