{ pkgs, ... }:
{
  services.emacs = {
    enable = true;
  };

  home.file.".emacs.d".source = ./.emacs.d;

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}
