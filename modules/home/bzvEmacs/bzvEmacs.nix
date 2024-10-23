{ pkgs, lib, config, ... }:
with lib;
let
  enabled = config.bzv.emacs.enable;
in
{
  options.bzv.emacs = {
    enable = mkEnableOption "Enable emacs config";
  };

  config = mkIf enabled {
    home.packages = with pkgs; [
      sqlite
      sqlitebrowser
      nodePackages.prettier
      pyright
      (python3.withPackages (ppkgs: with ppkgs;[
        boto3
      ]))
      nodejs_22
      monocraft
    ];

    services.emacs = {
      enable = true;
      package = pkgs.emacs;
      defaultEditor = true;
    };

    programs.emacs = {
      enable = true;
      package = pkgs.emacs;
    };

    home.file.".emacs.d" = {
      source = ./emacsConfig;
      recursive = true;
    };
  };
}
