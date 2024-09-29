{ pkgs, lib, config, ... }:
with lib;
{
  options = {
    bzvEmacs.enable = mkEnableOption "Enable emacs config";
  };

  config = mkIf config.bzvEmacs.enable {
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
