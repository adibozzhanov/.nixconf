{ pkgs, ... }:
{
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
    source = ./lispConf;
    recursive = true;
  };
}
