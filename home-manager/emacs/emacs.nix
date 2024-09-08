{ pkgs, ...}:

let
   use-emacs = pkgs.emacsWithPackagesFromUsePackage {
       config = ./init.el;
       defaultInitFile = true;
       alwaysEnsure = true;
   };
in   
{
  programs.emacs = {
    enable = true;
    package = use-emacs;
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs;
    defaultEditor = true;
  };
}
