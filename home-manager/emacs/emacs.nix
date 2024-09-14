{ pkgs, ... }:
{
  services.emacs = {
    enable = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };

  home.file.".emacs.d" = {
    source = ./lispConf;
    recursive = true;
  };
}
