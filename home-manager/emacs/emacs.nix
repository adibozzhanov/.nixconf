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
    (setq package-archives nil)
    (defalias 'yes-or-no-p 'y-or-n-p)
    ''; 
  };
}
