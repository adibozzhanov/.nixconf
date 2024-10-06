{ pkgs, lib, config, ... }:
with lib;
{
  options = {
    bzvEmacs.enable = mkEnableOption "Enable emacs config";
  };

  config = mkIf config.bzvEmacs.enable {

    home.packages = with pkgs; [
      sqlite
      sqlitebrowser
      nodePackages.prettier
      pyright
      python3
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
