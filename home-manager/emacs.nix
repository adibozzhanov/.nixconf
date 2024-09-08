{ pkgs, ...}:
{

  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;

    prelude = ''
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (menu-bar-mode -1)
    '';

  };
}
