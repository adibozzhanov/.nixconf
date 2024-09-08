{ pkgs, ...}:
{

  imports = [
    ./visual.nix
  ];
  
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraConfig = ''

    (defalias 'yes-or-no-p 'y-or-n-p)

    ''; 
  };
}
