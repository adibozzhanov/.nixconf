{ pkgs, ...}:
{

  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;

    init = {
      enable = true;
      recommendedGcSettings = true;
    };
  };
}
