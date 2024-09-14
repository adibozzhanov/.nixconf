{ pkgs, ... }:
{
  services.emacs = {
    enable = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };

  home.file.".emacs.d" = {
    source = ./lispConf;
    recursive = true;
  };
}
