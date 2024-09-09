{ pkgs, ... }:
{
  services.emacs = {
    enable = true;
  };

  home.file.".emacs.d" = {
    source = ./.emacs.d;
    recursive = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}
