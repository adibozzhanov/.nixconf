{ config, lib, inputs, pkgs, ... }:
let
  nixGLIntel = inputs.nixGL.packages.${pkgs.system}.nixGLIntel;
in
{
  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "e9f7da06111c7e669dbeef47f1878ed245392d4e7250237eaf791b734899be3c";
    })
  ];

  nixGL.prefix = "${nixGLIntel}/bin/nixGLIntel";

  xdg.configFile."environment.d/envvars.conf".text = ''
    PATH="$HOME/.nix-profile/bin:$PATH"
  '';

  programs.home-manager.enable = true;

  bzvDesktop.enable = true;
  bzvDesktop.isUbuntu = true;
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
    packages = with pkgs; [
      (config.lib.nixGL.wrap kitty)
    ];
    username = "adi";
    homeDirectory = "/home/adi";
    file = {
      "code/.keep".source = builtins.toFile "keep" "";
    };
    stateVersion = "24.05";
  };
}
