{ pkgs, ... }:
{
  services.emacs = {
    enable = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home.file.".emacs.d" = {
    source = ./.emacs.d;
    recursive = true;
  };
}
