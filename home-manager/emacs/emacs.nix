{ pkgs, ...}:
{

  import = [
    ./visual.nix
  ];
  
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}
